# source:
# Platform - env.sh | ~/code/src/github.com/publica-project/platform/lib/env.sh
# Stream - Terraform - env.sh | ~/code/src/github.com/publica-project/stream-terraform/lib/env.sh

function assume_role
	# Logic

    switch $argv[1]
        case ctv_engineer
            __publica_helper_ar "ctv_engineer" "publica" "arn:aws:iam::689975898194:role/engineer" "43200"
        case stream_engineer
            __publica_helper_ar "stream_engineer" "publica" "arn:aws:iam::546124526705:role/engineer" "43200"
        case stream_admin
            __publica_helper_ar "stream_admin" "publica" "arn:aws:iam::546124526705:role/ssai-admin"
        case '*'
            __publica_assume_role_help
    end
end

function __publica_assume_role_help
	echo "usage: assume_role <role_name>"
	echo -e "\trole_name = { ctv_engineer, stream_engineer, stream_admin }"
end

# Helper
# Platform - env.sh | ~/code/src/github.com/publica-project/platform/lib/env.sh

function __publica_helper_ar
	if count $argv > /dev/null
		else
		echo "ERR: assume_role <profile> <role>"
		return
	end
	set profile_name "$argv[1]" 
	set profile "$argv[2]"
	set role_arn "$argv[3]" 
	set duration "3600" 
	set -e AWS_PROFILE
	set account_id (echo "$role_arn" | cut -d: -f5)
	echo "Assume role with $role_arn profile: $profile"
	set token (aws sts assume-role --profile="$profile" --role-arn "$role_arn" --role-session-name "$profile_name" --duration-seconds "$duration" $mfa)
	if test "$token" = ""
		echo "ERR: failed to assume role $role_arn"
		return
	end

	set aws_access_key_id (echo "$token" | jq -c -r '.Credentials.AccessKeyId')
	set aws_secret_access_key (echo "$token" | jq -c -r '.Credentials.SecretAccessKey')
	set aws_session_token (echo "$token" | jq -c -r '.Credentials.SessionToken')
	if test "$aws_access_key_id" = "" -o "$aws_secret_access_key" = "" -o "$aws_session_token" = ""
		echo "ERR: failed to assume role $role_arn, creds malformed"
		return
	end
	aws configure set aws_access_key_id "$aws_access_key_id" --profile "$profile_name"
	aws configure set aws_secret_access_key "$aws_secret_access_key" --profile "$profile_name"
	aws configure set aws_session_token "$aws_session_token}" --profile "$profile_name"
	aws configure set x_account_id "$account_id" --profile "$profile_name"
	aws configure set x_principal_arn "$role_arn" --profile "$profile_name"
	export AWS_PROFILE="$profile_name" 
end