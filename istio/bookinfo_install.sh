oc new-project bookinfo --description='ISTIO Demo MicroServices App' --display-name='BookInfos'
oc adm policy add-scc-to-user anyuid -z default -n bookinfo
oc adm policy add-scc-to-user privileged -z default -n bookinfo
oc apply -n bookinfo -f https://raw.githubusercontent.com/Maistra/bookinfo/master/bookinfo.yaml
oc apply -n bookinfo -f https://raw.githubusercontent.com/Maistra/bookinfo/master/bookinfo-gateway.yaml
sleep 10
export GATEWAY_URL=$(oc get route -n istio-system istio-ingressgateway -o jsonpath='{.spec.host}')
curl -o /dev/null -s -w "%{http_code}\n" http://$GATEWAY_URL/productpage
sleep 10
oc apply -n bookinfo -f https://raw.githubusercontent.com/istio/istio/release-1.1/samples/bookinfo/networking/destination-rule-all-mtls.yaml
oc get destinationrules -o yaml
