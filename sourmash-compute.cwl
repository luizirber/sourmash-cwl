#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
baseCommand: ['sourmash', 'compute']

requirements:
  - class: InlineJavascriptRequirement

hints:
  - class: DockerRequirement
    dockerPull: "quay.io/luizirber/sourmash-cwl:latest"

inputs:
  sequences:
    type: File[]
    inputBinding: {}
#    format:
#      - edam:format_1929  # FASTA
#      - edam:format_1930  # FASTQ
  ksize:
    type: string[]?
    inputBinding:
      prefix: "--ksize"
      itemSeparator: ","
  scaled:
    type: int?
    inputBinding:
      prefix: "--scaled"
  num_hashes:
    type: int?
    inputBinding:
      prefix: "-n"
  merge:
    type: string?
    inputBinding:
      prefix: "--merge"
  output:
    type: File?
    inputBinding:
      prefix: "-o"

  # booleans
  check_sequence:
    type: boolean?
    inputBinding:
      prefix: "--check-sequence"
  force:
    type: boolean?
    inputBinding:
      prefix: "--force"
  name_from_first:
    type: boolean?
    inputBinding:
      prefix: "--name-from-first"
  singleton:
    type: boolean?
    inputBinding:
      prefix: "--singleton"
  track_abundance:
    type: boolean?
    inputBinding:
      prefix: "--track-abundance"
  randomize:
    type: boolean?
    inputBinding:
      prefix: "--randomize"

  # input type switches
  dna:
    type: boolean?
    inputBinding:
      prefix: "--dna"
  no_dna:
    type: boolean?
    inputBinding:
      prefix: "--no-dna"
  protein:
    type: boolean?
    inputBinding:
      prefix: "--protein"
  no_protein:
    type: boolean?
    inputBinding:
      prefix: "--no-protein"
  input_is_protein:
    type: boolean?
    inputBinding:
      prefix: "--input-is-protein"

  # rarely used
  seed:
    type: int?
    inputBinding:
      prefix: "--seed"
  license:
    type: string?
    inputBinding:
      prefix: "--license"

outputs:
  signature:
    type: File
    outputBinding:
      glob: $(inputs.output || inputs.sequences[0].basename).sig

s:author:
  - class: s:Person
    s:identifier: https://orcid.org/0000-0003-4371-9659
    s:email: mailto:lcirberjr@ucdavis.edu
    s:name: Luiz Irber

s:citation: https://dx.doi.org/10.21105/joss.00027
s:codeRepository: https://github.com/dib-lab/sourmash
s:dateCreated: "2018-06-30"
s:license: "https://spdx.org/licenses/BSD-3-Clause"
s:copyrightHolder: "The Regents of the University of California"

$namespaces:
  edam: http://edamontology.org/
  s: http://schema.org/
$schemas:
  - http://edamontology.org/EDAM_1.16.owl
  - https://schema.org/docs/schema_org_rdfa.html
