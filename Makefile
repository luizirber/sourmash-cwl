all: run_plain run_ksizes run_scaled

run_%: sourmash.cwl jobs/job-plain.yml
	cwl-runner $^
	rm test.fa.sig
