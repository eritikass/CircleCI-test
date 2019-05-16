#!/bin/bash

# https://stackoverflow.com/a/10660730/10436382
rawurlencode() {
  local string="${1}"
  local strlen=${#string}
  local encoded=""
  local pos c o

  for (( pos=0 ; pos<strlen ; pos++ )); do
     c=${string:$pos:1}
     case "$c" in
        [-_.~a-zA-Z0-9] ) o="${c}" ;;
        * )               printf -v o '%%%02x' "'$c"
     esac
     encoded+="${o}"
  done
  echo "${encoded}"    # You can either set a return variable (FASTER) 
  #REPLY="${encoded}"   #+or echo the result (EASIER)... or both... :p
}

main() {

    MSG="CI=$(rawurlencode "$CI")"
    MSG="CIRCLE_BRANCH=$(rawurlencode "$CIRCLE_BRANCH")&${MSG}"
    MSG="CIRCLE_BUILD_NUM=$(rawurlencode "$CIRCLE_BUILD_NUM")&${MSG}"
    MSG="CIRCLE_BUILD_URL=$(rawurlencode "$CIRCLE_BUILD_URL")&${MSG}"
    MSG="CIRCLE_COMPARE_URL=$(rawurlencode "$CIRCLE_COMPARE_URL")&${MSG}"
    MSG="CIRCLE_JOB=$(rawurlencode "$CIRCLE_JOB")&${MSG}"
    MSG="CIRCLE_PROJECT_REPONAME=$(rawurlencode "$CIRCLE_PROJECT_REPONAME")&${MSG}"
    MSG="CIRCLE_PROJECT_USERNAME=$(rawurlencode "$CIRCLE_PROJECT_USERNAME")&${MSG}"
    MSG="CIRCLE_PULL_REQUEST=$(rawurlencode "$CIRCLE_PULL_REQUEST")&${MSG}"
    MSG="CIRCLE_SHA1=$(rawurlencode "$CIRCLE_SHA1")&${MSG}"
    MSG="CIRCLE_TAG=$(rawurlencode "$CIRCLE_TAG")&${MSG}"
    MSG="CIRCLE_USERNAME=$(rawurlencode "$CIRCLE_USERNAME")&${MSG}"
    MSG="CIRCLE_WORKFLOW_ID=$(rawurlencode "$CIRCLE_WORKFLOW_ID")&${MSG}"
    MSG="CIRCLECI=$(rawurlencode "$CIRCLECI")&${MSG}"

    aws sns publish --topic-arn=${AWS_SNS_NAME} --message "${MSG}"

}

main "$@"