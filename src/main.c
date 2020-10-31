#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define MAX_ARRAY_LENGTH 100
#define FROM_STRING "--from="
#define TO_STRING "--to="

extern void quick_sort(long long*, int);

struct parameters
{
	int from_was_set;
	long long from;
	
	int to_was_set;
	long long to;
};

int process_parameters(int argc, char** argv, struct parameters* params)
{
	if(argc < 2) return -1;
	if(argc > 3) return -2;
	if(argc == 3 && strncmp(argv[1], argv[2], strcspn(argv[1], "=")) == 0) return -3;
	
	for(int i = 1; i < argc; i++)
	{
		char* ptr;
		
		if(strncmp(FROM_STRING, argv[i], strlen(FROM_STRING)) == 0 && params->from_was_set == 0)
		{
			params->from = strtoll(strchr(argv[i], '=') + 1, &ptr, 10);
			params->from_was_set = 1;
		}
		
		if(strncmp(TO_STRING, argv[i], strlen(TO_STRING)) == 0 && params->to_was_set == 0)
		{
			params->to = strtoll(strchr(argv[i], '=') + 1, &ptr, 10);
			params->to_was_set = 1;
		}
	}
	
	if(params->from_was_set == 0 && params->to_was_set == 0) return -4;
	
	return 0;
}

int process_user_input(long long* array, struct parameters params)
{
	long long given_number;
	
	char white_space = ' ';
    int array_max_index = 0;
	
    while(white_space == ' ')
	{
        scanf("%lld%c", &given_number, &white_space);
		
		if(given_number <= params.from && params.from_was_set == 1)
		{
			fprintf(stdout, "%lld ", given_number);
		}
		
		if(given_number >= params.to && params.to_was_set == 1)
		{
			fprintf(stderr, "%lld ", given_number);
		}
		
		if((given_number > params.from || params.from_was_set == 0) && (given_number < params.to || params.to_was_set == 0))
		{
			array[array_max_index] = given_number;
			array_max_index++;
		}
    }
	
	return array_max_index;
}

int compare_two_arrays(long long* array1, long long* array2, int length)
{
	int mismatch = 0;
	
	for (int i = 0; i < length; i++)
	{
		if(array1[i] != array2[i]) mismatch++;
	}
	
	return mismatch;
}

int main(int argc, char** argv)
{
	struct parameters params = {0, 0, 0, 0};
	
	int process_parameters_exit_code = process_parameters(argc, argv, &params);
	if(process_parameters_exit_code != 0) return process_parameters_exit_code;
	
	int filtered_array_length;
	long long input_array[MAX_ARRAY_LENGTH];
	
	filtered_array_length = process_user_input(input_array, params);
	
	long long* input_array_copy = (long long*)malloc(filtered_array_length * sizeof(long long));
	
	memcpy(input_array_copy, input_array, filtered_array_length * sizeof(long long));
	
	quick_sort(input_array_copy, filtered_array_length);

	int mismatch_elements = compare_two_arrays(input_array, input_array_copy, filtered_array_length);
	
	free(input_array_copy);
	
	return mismatch_elements;
}