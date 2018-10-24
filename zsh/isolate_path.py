#!/usr/bin/python3
import os
import sys


def main(*args):
	path = os.environ["PATH"]
	path = path.split(":")
	idx = 0
	while idx < len(path):
		elem = path[idx]
		if '/mnt/c' in elem:
			del path[idx]
			idx -= 1
		idx += 1
	print(':'.join(path))


if __name__ == '__main__':
	main(*sys.argv[1:])

