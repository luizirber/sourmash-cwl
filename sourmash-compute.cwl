#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
baseCommand: ['sourmash', 'compute']
inputs:
  filename:
    type: File
    inputBinding:
      position: 999
  ksize:
    type: string[]?
    inputBinding:
      position: 1
      prefix: "--ksize"
      itemSeparator: ","
  scaled:
    type: int?
    inputBinding:
      position: 2
      prefix: "--scaled"
  num_hashes:
    type: int?
    inputBinding:
      position: 3
      prefix: "-n"
  merge:
    type: string?
    inputBinding:
      position: 4
      prefix: "--merge"
  output:
    type: string?
    inputBinding:
      position: 5
      prefix: "-o"

  # booleans
  check_sequence:
    type: boolean?
    inputBinding:
      position: 100
      prefix: "--check-sequence"
  force:
    type: boolean?
    inputBinding:
      position: 101
      prefix: "--force"
  name_from_first:
    type: boolean?
    inputBinding:
      position: 102
      prefix: "--name-from-first"
  singleton:
    type: boolean?
    inputBinding:
      position: 103
      prefix: "--singleton"
  track_abundance:
    type: boolean?
    inputBinding:
      position: 104
      prefix: "--track-abundance"
  randomize:
    type: boolean?
    inputBinding:
      position: 105
      prefix: "--randomize"

  # input type switches
  dna:
    type: boolean?
    inputBinding:
      position: 200
      prefix: "--dna"
  no_dna:
    type: boolean?
    inputBinding:
      position: 201
      prefix: "--no-dna"
  protein:
    type: boolean?
    inputBinding:
      position: 202
      prefix: "--protein"
  no_protein:
    type: boolean?
    inputBinding:
      position: 203
      prefix: "--no-protein"
  input_is_protein:
    type: boolean?
    inputBinding:
      position: 204
      prefix: "--input-is-protein"

  # rarely used
  seed:
    type: int?
    inputBinding:
      position: 300
      prefix: "--seed"
  license:
    type: string?
    inputBinding:
      position: 301
      prefix: "--license"
outputs:
  signature:
    type: File
    outputBinding:
      glob: $(inputs.filename.basename).sig
