#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include <unistd.h>
#include <sys/wait.h>
#include <string.h>

volatile sig_atomic_t quit_program = 0;

void handle_sigterm(int signum) {
    printf("\nParent process: Received SIGTERM (%d). Exiting gracefully.\n", signum);
    quit_program = 1;
}

void handle_sigint(int signum) {
    printf("\nParent process: Received SIGINT (%d). Ignoring this signal.\n", signum);
}

int main() {
    pid_t pid1, pid2;

    signal(SIGTERM, handle_sigterm);
    signal(SIGINT, handle_sigint);
    printf("Parent process (PID %d) running\n", getpid());

    if ((pid1 = fork()) == -1) {
        perror("fork 1 failed");
        exit(EXIT_FAILURE);
    } else if (pid1 == 0) {
        sleep(5);
        printf("Child process 1 (PID %d): Sending SIGTERM to parent process (PID %d)\n", getpid(), getppid());
        if (kill(getppid(), SIGTERM) == -1) {
            perror("kill SIGTERM failed");
        }
        exit(EXIT_SUCCESS);
    }

    if ((pid2 = fork()) == -1) {
        perror("fork 2 failed");
        exit(EXIT_FAILURE);
    } else if (pid2 == 0) {
        sleep(10);
        printf("Child process 2 (PID %d): Sending SIGINT to parent process (PID %d)\n", getpid(), getppid());
        if (kill(getppid(), SIGINT) == -1) {
            perror("kill SIGINT failed");
        }
        exit(EXIT_SUCCESS);
    }

    while (!quit_program) {
        sleep(1);
    }

    printf("Parent process: Cleaning up and waiting for children to finish.\n");

    if (kill(pid2, SIGKILL) == -1) {
        perror("kill SIGKILL on child process 2 failed");
    }

    waitpid(pid1, NULL, 0);
    waitpid(pid2, NULL, 0);
    printf("Parent process: All child processes terminated. Parent process exiting.\n");

    return 0;
}
