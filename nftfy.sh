#

set -x
find . -name '*~1' -delete
qm1=$(ipfs add -n -r $HOME/clients/phenomx -Q)
qm2=$(ipfs add -r /media/$USER/4TB/repos/gitlab.com/websites/phenomx.ch -Q)
qm3=$(ipfs add -r /media/$USER/4TB/repos/gitlab.com/websites/phenomx.ml -Q)
qm4=$(ipfs add -r /media/$USER/4TB/repos/gitlab.com/websites/phenomx.me -Q)
qm5=$(ipfs add -r /media/$USER/4TB/images/NFTs -Q)
qm6=$(ipfs add -r $HOME/NFTbranding/PhenomX -Q)
qm7=$(ipfs add -r $HOME/Picturs/NFTs -Q)
qm8=$(ipfs add -r $HOME/repo/gist/proof-of-screen/ts.log -Q)
qm9=$(ipfs add -r $HOME/repo/gist/proof -Q)
qm10=$(ipfs add -n -r $HOME/repo/gist/sha-loose -Q)


cat > list-qm.txt <<EOF
--- # top merkle tree
$qm1
$qm2
$qm3
$qm4
$qm5
$qm6
$qm7
$qm8
$qm9
$qm10
---
EOF
qm=$(ipfs add list-qm.txt -Q)

echo $qm | cat list-qm.txt - | dee -q list-qm.txt
