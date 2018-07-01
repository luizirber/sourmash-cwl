all: run_plain run_ksizes run_scaled run_num_hashes run_many

run_%: sourmash-compute.cwl jobs/job-%.yml
	cwl-runner --no-container $^
	rm test.fa.sig
