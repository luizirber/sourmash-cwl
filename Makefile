run:
	cwl-runner sourmash.cwl job.yml
	-rm test.fa.sig

run_ksizes:
	cwl-runner sourmash.cwl job-ksizes.yml
	-rm test.fa.sig
