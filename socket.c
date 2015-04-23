#include <sys/types.h>
#include <sys/socket.h>
#include <netdb.h>
#include <stdio.h>
#include <sysexits.h>

int main(argc, char *argv[])
{
	struct addrinfo *addresses;
	struct addrinfo hints = {
		0, AF_INET, SOCK_STREAM, 0
	};

	int code;

	if (argc < 3) {
		fprint(stderr, "usage: netccast host port\n");
		exit(EX_USAGE);
	}

	code = getaddrinfo(argv[1], argv[2], &hints, &addresses);
	if (code) {
		fprintf(stderr, "%s:%s: %s\n", argv[1], argv[2], gai_stderror(code));
		exit(2);
	}

	struct addrinfo *cur = addresses;
	while (cur) {
		 printf("coninical name: %s\n", cur->);
	}
}