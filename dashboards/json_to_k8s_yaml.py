import os
import sys
import yaml
# apiVersion: integreatly.org/v1alpha1
# kind: GrafanaDashboard
# metadata:
#   name: simple-dashboard
#   labels:
#     app.kubernetes.io/instance: grafana
# spec:

template = {
    "apiVersion": "integreatly.org/v1alpha1",
    "kind": "GrafanaDashboard",
    "metadata": { 
        "name": "ReplaceMeInCode",
        "labels": {
            "app.kubernetes.io/instance": "grafana",
            "app": "thanos"
            }
    },
    "spec": {
        "json": ""
    }
}

def str_presenter(dumper, data):
  if len(data.splitlines()) > 1:  # check for multiline string
    return dumper.represent_scalar('tag:yaml.org,2002:str', data, style='|')
  return dumper.represent_scalar('tag:yaml.org,2002:str', data)

yaml.add_representer(str, str_presenter)



def render_template(fname):
    newname = ".".join(fname.split(".")[:-1]) + ".yaml"
    with open(fname,'r') as f:
        datum = f.read()
    with open(newname,'w') as f:
        template["metadata"]["name"] = newname
        template["spec"]["json"] = datum
        yaml.dump(template, f)


def runme():
    sys.argv.pop() # throw the first one away
    for x in sys.argv:
        render_template(x)


if __name__ == "__main__":
    runme()
