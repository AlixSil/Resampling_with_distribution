####LIBRARIES####
require(data.table)

####DATA LOADING####
segments_to_sample = fread("Examples/segments.tsv")
ditribution_to_follow = fread("Examples/categories_to_resample.tsv")
#Note, the only columns whose names will influence this scripts are : category, categories, and number_to_sample. All of the others can be anything, you can even add more

####DATA TREATMENT####
#This part is dedicated to the formatting of the data in order to make the resampling more efficient
segments_to_sample[, number_to_resample := ditribution_to_follow[match(segments_to_sample$category, categories), number_to_sample]]


#####Creation of one sampling (with replace, meaning one segment can be selected several times)#####
sampled_segments = segments_to_sample[ , .SD[sample(1:.N, number_to_resample[1], replace = T)], by = category] #That's where the magic happens
#Description of the inner working of this line would necessitate heavy primers on the data.table library
#In practice, in each category, in selects randomly (with replacement) the number of line in the "number_to_resample" column


#Cleanup of unnecessary variables
sampled_segments[, number_to_resample := NULL]

#Finished resample
print(sampled_segments)
