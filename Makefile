all: run_plain run_ksizes run_scaled run_num-hashes

run_%: sourmash.cwl jobs/job-plain.yml
	cwl-runner $^
	rm test.fa.sig
