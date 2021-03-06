BUCKET_NAME="census-ml-engine"
REGION=asia-east1

TRAIN_DATA=gs://$BUCKET_NAME/data/adult.data.csv
EVAL_DATA=gs://$BUCKET_NAME/data/adult.test.csv
TEST_JSON=gs://$BUCKET_NAME/data/test.json

JOB_NAME="census_dist_1"
OUTPUT_PATH=gs://$BUCKET_NAME/$JOB_NAME
SCALE_TIER="STANDARD_1"

gcloud ml-engine jobs submit training $JOB_NAME \
    --job-dir $OUTPUT_PATH \
    --runtime-version 1.0 \
    --module-name trainer.task \
    --package-path trainer/ \
    --region $REGION \
    --scale-tier $SCALE_TIER \
    -- \
    --train-files $TRAIN_DATA \
    --eval-files $EVAL_DATA \
    --train-steps 50000 \
    --verbosity DEBUG