cwlVersion: v1.0
steps:
  read-potential-cases-omop:
    run: read-potential-cases-omop.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
  benign-neoplasm-of-colon-rectum-anus-and-anal-canal-polypectomy---primary:
    run: benign-neoplasm-of-colon-rectum-anus-and-anal-canal-polypectomy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-omop/output
  benign-neoplasm-of-colon-rectum-anus-and-anal-canal-excision---primary:
    run: benign-neoplasm-of-colon-rectum-anus-and-anal-canal-excision---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: benign-neoplasm-of-colon-rectum-anus-and-anal-canal-polypectomy---primary/output
  benign---primary:
    run: benign---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: benign-neoplasm-of-colon-rectum-anus-and-anal-canal-excision---primary/output
  benign-neoplasm-of-colon-rectum-anus-and-anal-canal-flexure---primary:
    run: benign-neoplasm-of-colon-rectum-anus-and-anal-canal-flexure---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: benign---primary/output
  benign-neoplasm-of-colon-rectum-anus-and-anal-canal---primary:
    run: benign-neoplasm-of-colon-rectum-anus-and-anal-canal---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: benign-neoplasm-of-colon-rectum-anus-and-anal-canal-flexure---primary/output
  benign---secondary:
    run: benign---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: benign-neoplasm-of-colon-rectum-anus-and-anal-canal---primary/output
  benign-neoplasm-of-colon-rectum-anus-and-anal-canal-polyp---secondary:
    run: benign-neoplasm-of-colon-rectum-anus-and-anal-canal-polyp---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: benign---secondary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule9
      potentialCases:
        id: potentialCases
        source: benign-neoplasm-of-colon-rectum-anus-and-anal-canal-polyp---secondary/output
class: Workflow
inputs:
  inputModule1:
    id: inputModule1
    doc: Js implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
  inputModule9:
    id: inputModule9
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
