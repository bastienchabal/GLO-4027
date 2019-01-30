#!/bin/sh

if ! [ -x "$(command -v kaggle)" ]; then
    echo "Package kaggle is NOT installed! Please install it through https://github.com/Kaggle/kaggle-api"
    exit 1
fi

echo ''
echo '---------- Display your kaggle config'
echo '-- Documentation: https://github.com/Kaggle/kaggle-api#api-credentials'
echo ''

kaggle config view

echo ''
echo ''
echo '---------- Submit submission file (./data/submission.csv)'
echo '-- Note: you will need to accept competition rules at https://www.kaggle.com/c/bike-sharing-demand/rules'
echo ''

if [ ! -f ./data/submission.csv ]; then
    echo 'Submission file not found (./data/submission.csv)'
    exit 1
fi

kaggle competitions submit bike-sharing-demand -f ./data/submission.csv -m test

echo ''
echo ''
echo '---------- Display last submissions'
echo ''

kaggle competitions submissions bike-sharing-demand
