#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>
#include <errno.h>

#define num_child_process 5

int main() {
    pid_t pid;
    int i;
    int status;
    int pending = num_child_process;

    printf("Parent process (PID %d) starting...\n", getpid());

    for (i = 0; i < num_child_process; i++) {
        pid = fork();

        if (pid < 0) {
            perror("fork failed");
            exit(EXIT_FAILURE);
        } else if (pid == 0) {
            printf("Child process %d (PID %d) created.\n", i + 1, getpid());
            sleep(1);
            printf("Child process %d (PID %d) terminating.\n", i + 1, getpid());
            exit(EXIT_SUCCESS);
        }
    }

    printf("\nParent process processes waiting for child processes to terminate...\n");

    while (pending > 0) {
        pid_t term_pid = waitpid(-1, &status, 0);

        if (term_pid > 0) {
            if (WIFEXITED(status)) {
                printf("Parent processes cleaned up child with PID %d (Exit status: %d).\n",
                       term_pid, WEXITSTATUS(status));
            } else {
                printf("Parent processes cleaned up child with PID %d (Abnormal termination).\n", term_pid);
            }
            pending--;
        } else if (term_pid == -1 && errno != EINTR) {
            perror("waitpid error");
            break;
        }

    }

    printf("\nAll child processes cleaned up. Parent process (PID %d) exiting.\n", getpid());

    return 0;
}
