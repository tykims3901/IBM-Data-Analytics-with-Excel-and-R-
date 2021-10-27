# code to download the dataset
download.file("https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-RP0101EN-Coursera/v2/dataset/The_Artist.txt", destfile="The_Artist.txt")

my_data <- readLines("The_Artist.txt")
my_data

length(my_data)

file.size("The_Artist.txt")

my_data1 <- scan("The_Artist.txt", "")
my_data1

length(my_data1)

my_data1 <- scan("The_Artist.txt", ",")
word_factor <- factor(my_data1)
summary(word_factor)

nchar(my_data[1])

toupper(my_data[3])

tolower(my_data[3])

chartr(" ", "-", my_data[1])

character_list <- strsplit(my_data[1], " ")
word_list <- unlist(character_list)
word_list

new_third <- chartr(" ", "_", my_data[3])
new_third
character_list <- strsplit(new_third, "_")
word_list <- unlist(character_list)
word_list

sorted_list <- sort(word_list)
sorted_list

paste(sorted_list, collapse = " ")

sub_string <- substr(my_data[1], start = 4, stop = 50)
sub_string

trimws(sub_string)

library(stringr)
str_sub(my_data[1], -8, -1)

test@testing.com

So, an email is composed by a string followed by an @ symbol followed by another string. In R regular expressions, we can express this as:
  
  $<.+@.>+$
  
  Where:
  
  The . symbol matches with any character.
The + symbol repeats the previous symbol one or more times. So, .+ will match with any string.
The @ symbol only matches with the @ character.
Now, for our problem, which is extracting the domain from an email excluding the regional url code, we need an expression that specifically matches with what we want:
  
  @.+\\.

Where the \\. symbol specifically matches with the '.' character.

Now let's look at some R functions that work with regular expressions.

The grep function below takes in a regular expression and a list of strings to search through and returns the positions of where they appear in the list.

# Load a email dataframe
email_df <- read.csv("https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-RP0101EN-Coursera/v2/dataset/email%20list.csv")
email_df

# Load a email dataframe
grep("@.+",  c("test@testing.com" , "not an email", "test2@testing.com"))

# Load a email dataframe
grep("@.+",  c("test@testing.com", "not an email", "test2@testing.com"), value=TRUE)

grep("@.+\\.com",  c("test@testing.co", "test@ibm.com", "test2@testing.org"), value=TRUE)

gsub("@.+", "@newdomain.com", c("test@testing.com", "not an email", "test2@testing.com"))

matches <- regexpr("@.*", c("test@testing.com", "not an email", "test2@testing.com"))
regmatches(c("test@testing.com", "not an email", "test2@testing.com"), matches)

matches <- regexpr("@.*\\.", email_df[,'Email'])
email_df[,'Domain'] = regmatches(email_df[,'Email'], matches)

email_df