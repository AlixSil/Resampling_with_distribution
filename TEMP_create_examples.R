require(data.table)


categories = c("[0-10]", "[10-20]", "[20-30]", "[30-40]", "Others")


example_segments = data.table(chromosome = sample(1:22, 100, replace = T),
                              start = sample(1:10e7, 100, replace = T))

example_segments[, end := start + sample(1000:10000, 100, replace = T)]
example_segments[, category := sample(categories, 100, replace = T)]


write.table(example_segments, file = "Examples/segments.tsv", sep = "\t", quote = F, row.names = F)


categories_to_resample = data.table(categories, number_to_sample = sample(1:10, 5, replace = T))


print(example_segments)
print(categories_to_resample)

write.table(categories_to_resample, file = "Examples/categories_to_resample.tsv", sep = "\t", quote = F, row.names = F)
