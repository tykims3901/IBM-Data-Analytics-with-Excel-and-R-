# code to download the dataset
download.file("https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-RP0101EN-Coursera/v2/dataset/movies-db.csv", destfile="movies-db.csv")

ratings <- c(8.7, 6.9, 8.5)
mean(ratings)
sort(ratings)
sort(ratings, decreasing = TRUE)
max(ratings)
min(ratings)

printHelloWorld <- function(){
  print("Hello World")
}
printHelloWorld()

add <- function(x, y) {
  x + y
}
add(3, 4)

add <- function(x, y){
  return(x + y)
}

isGoodRating <- function(rating){
  #This function returns "NO" if the input value is less than 7. Otherwise it returns "YES".
  
  if(rating < 7){
    return("NO") # return NO if the movie rating is less than 7
    
  }else{
    return("YES") # otherwise return YES
  }
}
isGoodRating(6)
isGoodRating(9.5)

isGoodRating <- function(rating, threshold = 7){
  if(rating < threshold){
    return("NO") # return NO if the movie rating is less than the threshold
  }else{
    return("YES") # otherwise return YES
  }
}
isGoodRating(6)
isGoodRating(10)
isGoodRating(8, threshold = 8.5)
isGoodRating(8, 8.5)

# Write your code below. Don't forget to press Shift+Enter to execute the cell
isBadRating <- function(rating, threshold = 5){
  if(rating > threshold){
    return("NO") # return NO if the movie rating is larger than the threshold
  }else{
    return("YES") # otherwise return YES
  }
}

my_data <- read.csv("movies-db.csv")
head(my_data)

akira <- my_data[my_data$name == "Akira", "average_rating"]
akira

watchMovie <- function(data, moviename){
  rating <- data[data["name"] == moviename,"average_rating"]
  return(isGoodRating(rating))
}
watchMovie(my_data, "Akira")

watchMovie <- function(data, moviename, my_threshold){
  rating <- data[data$name == moviename,"average_rating"]
  return(isGoodRating(rating, threshold = my_threshold))
}
watchMovie(my_data, "Akira", 7)

watchMovie <- function(data, moviename, my_threshold = 7){
  rating <- data[data[,1] == moviename,"average_rating"]
  return(isGoodRating(rating, threshold = my_threshold))
}
watchMovie(my_data,"Akira")
is_watch <- watchMovie(my_data, "Akira")
is_watch

watchMovie <- function(moviename, my_threshold = 7){
  rating <- my_data[my_data[,1] == moviename,"average_rating"]
  
  memo <- paste("The movie rating for", moviename, "is", rating)
  print(memo)
  
  return(isGoodRating(rating, threshold = my_threshold))
}
is_watch <- watchMovie("Akira")
is_watch

watchMovie <- function(moviename, my_threshold = 7){
  rating <- my_data[my_data[,1] == moviename,"average_rating"]
  # Get mean rating
  print(my_data$average_rating)
  mean_threshold <- mean(my_data$average_rating)
  print(mean_threshold)
  memo <- paste("The movie rating for", moviename, "is", rating)
  print(memo)
  
  return(isGoodRating(rating, threshold = mean_threshold))
}

watchMovie <- function(moviename, my_threshold = 7){
  rating <- my_data[my_data[,1] == moviename,"average_rating"]
  
  memo <- paste("The movie rating for", moviename, "is", rating)
  print(memo)
  
  isGoodRating(rating, threshold = my_threshold)
}
watchMovie("Akira")
memo

myFunction <- function(){
  y <<- 3.14
  return("Hello World")
}
myFunction()
y
