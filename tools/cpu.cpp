
#include <errno.h>
#include <string.h>
#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>
#include <stdlib.h>
#include <signal.h>
#include <vector>
#include <getopt.h>

static int g_process_count = 8;
static int g_cpu_usage = 80;
static std::vector<pid_t> g_child_processes;
static int g_show_usage = 0;

static void show_usage()
{
    fprintf(stdout, 
"Usage: cpu [--process-count=N] [--cpu-usage=N]\n"
"\n"
"  -c, --process-count=N  process count\n"
"  -u, --cpu-usage=N      cpu usage\n"
"\n"
"Examples:\n"
"  cpu --process-count=8 --cpu-usage=60\n");
}

int child_main()
{
    for (;;) {
    }

    return 0;
}

int main(int argc, char* argv[])
{
    int c;
    int digit_optind = 0;

    while (1) {
        int this_option_optind = optind ? optind : 1;
        int option_index = 0;
        static struct option long_options[] = {
            {"process-count", 1, 0, 'c' },
            {"cpu-usage",     1, 0, 'u' },
            {"help",          0, 0, 'h' },
            {0,               0, 0, 0   }
        };

        c = getopt_long(argc, argv, "c:u:?h", long_options, &option_index);
        if (c == -1)
            break;

        switch (c) {
            case 0:
                break;
            case 'c':
                g_process_count = atoi(optarg);
                break;
            case 'u':
                g_cpu_usage = atoi(optarg);
                break;
            case 'h':
                g_show_usage = 1;
                break;
            default:
                printf ("?? getopt returned character code 0%o ??\n", c);
        }
    }

    if (optind != argc) {
        show_usage();
        return -1;
    }

    if (g_show_usage) {
        show_usage();
        return 0;
    }

    fprintf(stdout, "process count %d cpu usage %d\n", g_process_count, g_cpu_usage);

    for (int i = 0; i < g_process_count; ++i) {
        pid_t pid = fork();
        if (pid == -1) {
            fprintf(stderr, "fork failed %d:%s\n", errno, strerror(errno));
            return -1;
        }

        if (pid == 0) { // child
            child_main();
            exit(0);
        }

        g_child_processes.push_back(pid);
    }

    for (;;) {
        for (std::vector<pid_t>::const_iterator iter = g_child_processes.begin(); iter != g_child_processes.end(); ++iter) {
            pid_t child_pid = *iter;
            kill(child_pid, SIGSTOP);
        }
        usleep((100 - g_cpu_usage) * 1000);
        for (std::vector<pid_t>::const_iterator iter = g_child_processes.begin(); iter != g_child_processes.end(); ++iter) {
            pid_t child_pid = *iter;
            kill(child_pid, SIGCONT);
        }
        usleep(g_cpu_usage * 1000);
    }

    return 0;
}



