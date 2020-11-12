# API Reference generator

This is an API reference docs generator that uses the
[k8s.io/gengo](https://godoc.org/k8s.io/gengo) project to parse types and
generate API documentation from it.

This tool relies only on the Go source code containing the type definitions.
For references to external type definitions, especially those from the
`k8s.io/kubernetes` repo, you can tell the tool to generate links to the
existing docs, which can be the GoDocs if no better option exists.

## Try it out

1. Clone this repository.

2. Make sure you have go1.15+ instaled. Then run `make`, you should get a
   `genref` binary.

3. Generate reference doc for some API types.

   ```shell
   ./genref -include kubelet-config --output samples
   ```

4. Visit `kube-scheduler.v1beta1.html` to view the results.

## Credit

This project is inspired and largely based on the
[gen-crd-api-reference-docs](https://github.com/ahmetb/gen-crd-api-reference-docs)
tool developed by Ahmet Alp Balkan (@ahmetb).

The tool was reworked for:

- refacted code structure;
- support to YAML config file so we can put comments in it;
- added (and tested) source for parsing Kubernetes unpublished API types;
- allow for parsing across packages which have emerged in many projects;
- use go.mod to manage package version for parsing;
- output styling changes to better align with Kubernetes API reference docs.
 
## TODOs

- [ ] Allow user to specify the top level structs.

