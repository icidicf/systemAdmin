#/usr/bin

declare -A asso_array

asso_array=([apple]='100dollar' [orange]='150dollar')
asso_array['pine']='170dollor'


echo "apple cost ${asso_array[apple]}"
echo "pine cost ${asso_array['pine']}"

echo "the key for associate array is ${!asso_array[*]}"
