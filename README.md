# Helm chart for receipts

## What?

This is an helm chart used for demo purposes. It will generate a set of receipts based on a helm chart template approach

## How to

This helm char was created by executing 
```sh
helm create receita
```

To render all the templates just run from the root 
```sh
helm template receita
```

To generate a specific file `receita` and 

```sh
helm template -s templates/receipt.yaml -f values.yaml .
```

To create a tar.gz file with the chart, from the root just run

```sh
helm package receita
```


## Resources

[Installing Helm](https://helm.sh/docs/intro/install/)
