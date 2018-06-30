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
      position: 7
      prefix: "--ksize"
      itemSeparator: ","
outputs:
  signature:
    type: File
    outputBinding:
      glob: $(inputs.filename.basename).sig
