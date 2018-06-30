#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
baseCommand: ['sourmash', 'compute']
inputs:
  filename:
    type: File
    inputBinding:
      position: 99
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
outputs:
  signature:
    type: File
    outputBinding:
      glob: $(inputs.filename.basename).sig
