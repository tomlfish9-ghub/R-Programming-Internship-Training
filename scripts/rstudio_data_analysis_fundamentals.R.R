
# ============================================================
# R Programming & Data Analysis Fundamentals
# Undergraduate Research Internship Training
#
# Purpose:
# Introduce foundational R programming and data manipulation
# techniques to prepare students for research internship tasks.
#
# Software: R and RStudio
# Package: dplyr
#
# Topics Covered:
# 1. Basic R Operations
# 2. Creating Objects and Variables
# 3. Installing and Loading Packages
# 4. Exploring Data
# 5. Creating and Subsetting Data Frames
# 6. Filtering and Selecting Data
# 7. Summarizing Data
# 8. Creating and Modifying Variables
# 9. Basic Data Visualization
# 10. Applying Data Manipulation Techniques
# ============================================================


# ============================================================
# 1. BASIC R OPERATIONS
# ============================================================

# Perform basic arithmetic
1 + 2

# Calculate the natural logarithm
log(10)



# ============================================================
# 2. CREATING OBJECTS AND VARIABLES
# ============================================================

# Assign values to objects
x <- 5
y <- 7

# Display object values
x
y

# Perform calculations using objects
x + y
x - y



# ============================================================
# 3. INSTALLING AND LOADING PACKAGES
# ============================================================

# Install dplyr if it is not already installed.
# Run this command once if needed:
# install.packages("dplyr")

# Load dplyr for data manipulation
library(dplyr)



# ============================================================
# 4. EXPLORING DATA
# ============================================================

# Explore the built-in Titanic dataset
# Note: Titanic is included with R's datasets package.

# View summary statistics
summary(Titanic)

# Examine dataset structure
str(Titanic)

# Generate frequency tables
table(Titanic)

# Open dataset in RStudio's data viewer
View(Titanic)

# Display the first six observations
head(Titanic)

# Display the last six observations
tail(Titanic)



# ============================================================
# 5. CREATING AND SUBSETTING DATA FRAMES
# ============================================================

# Create a sample patient data frame
mydata <- data.frame(
  patient = c("Smith", "Jones", "Williams"),
  height = c(72, 61, 66),
  diabetic = c(TRUE, FALSE, FALSE))

# Display the complete data frame
mydata

# Select a specific row and column
mydata[3, 2]

# Select the first two rows of the height column
mydata[1:2, "height"]

# Select the diabetic column
mydata[, "diabetic"]

# Access a column using the $ operator
mydata$height

# Select the second and third height observations
mydata$height[2:3]



# ============================================================
# 6. EXAMINING AND RENAMING VARIABLES
# ============================================================

# Display existing column names
colnames(mydata)

# Assign new column names
colnames(mydata) <- c("Patient", "Height", "Diabetic")

# Display updated column names
colnames(mydata)

# Rename an individual column
colnames(mydata)[3] <- "Diabetes"

# Display final column names
colnames(mydata)



# ============================================================
# 7. FILTERING AND SELECTING DATA
# ============================================================

# Create a sample dog data frame
dog_data <- data.frame(
  id = c("Duke", "Lucy", "Buddy", "Daisy", "Bear", "Stella"),
  weight = c(25, 12, 58, 67, 33, 9),
  sex = c("M", "F", "M", "F", "M", "F"),
  location = c("north", "west", "north", "south", "west", "west"))

# Display the original dataset
dog_data

# Filter dogs weighing more than 40
heavy_dogs <- dog_data %>%
  filter(weight > 40)

heavy_dogs

# Filter female dogs located in the north or south
selected_dogs <- dog_data %>%
  filter(
    (location == "north" | location == "south") &
      sex == "F" )

selected_dogs



# ============================================================
# 8. SELECTING VARIABLES
# ============================================================

# Select two specific variables
select(dog_data, id, sex)

# Select all variables except id and sex
select(dog_data, -c(id, sex))



# ============================================================
# 9. SUMMARIZING DATA
# ============================================================

# Create a sample dataset
sample_data <- data.frame(
  group = c("A", "A", "B", "B", "C"),
  value = c(10, 15, 20, 25, 30))

# Calculate the overall mean
sample_data %>%
  summarize(
    mean_value = mean(value))

# Calculate the mean separately for each group
sample_data %>%
  group_by(group) %>%
  summarize(
    mean_value = mean(value),
    .groups = "drop")

# Calculate multiple summary statistics
group_summary <- sample_data %>%
  group_by(group) %>%
  summarize(
    mean_value = mean(value),
    max_value = max(value),
    count = n(),
    .groups = "drop")

# Display summarized results
group_summary



# ============================================================
# 10. USING FILTER WITH THE PIPE OPERATOR
# ============================================================

# Create a sample dataset
sample_records <- data.frame(
  ID = c(1, 2, 1, 3),
  value = c(10, 20, 30, 40))

# Filter records using the pipe operator
result <- sample_records %>%
  filter(ID == 1)

result

# Perform the same operation without the pipe operator
result <- filter(sample_records, ID == 1)

result



# ============================================================
# 11. CREATING AND MODIFYING VARIABLES WITH MUTATE
# ============================================================

# Examine the built-in mtcars dataset
head(mtcars)

# Convert vehicle weight from 1,000 pounds to kilograms
mtcars_analysis <- mtcars %>%
  mutate(
    wt_kg = wt * 1000 * 0.453592)

head(mtcars_analysis)

# Calculate the horsepower-to-weight ratio
mtcars_analysis <- mtcars_analysis %>%
  mutate(
    pwr_wt_ratio = hp / wt)

head(mtcars_analysis)

# Create multiple variables within one mutate operation
mtcars_analysis <- mtcars %>%
  mutate(
    wt_kg = wt * 1000 * 0.453592,
    pwr_wt_ratio = hp / wt )

head(mtcars_analysis)

# Demonstrate modifying an existing variable
# Preserve the original dataset by creating a separate object
mtcars_modified <- mtcars %>%
  mutate(
    wt = wt * 2)

head(mtcars_modified)



# ============================================================
# 12. BASIC DATA VISUALIZATION
# ============================================================

# Create a scatterplot using the mtcars dataset
plot(
  mtcars$mpg,
  mtcars$wt,
  main = "Vehicle Weight vs. Fuel Efficiency",
  xlab = "Miles per Gallon",
  ylab = "Weight (1,000 lbs)")



# ============================================================
# 13. APPLYING DATA MANIPULATION TECHNIQUES
# ============================================================

# Create a sample student dataset
students <- data.frame(
  name = c("Alice", "Bob", "Charlie", "Diana"),
  math_score = c(78, 85, 92, 88),
  english_score = c(82, 79, 95, 90))

# Display original student data
print(students)

# Calculate total and average scores
students <- students %>%
  mutate(
    total_score = math_score + english_score,
    average_score = total_score / 2 )

# Display updated student data
print(students)

# Assign letter grades based on average scores
students <- students %>%
  mutate(
    grade = case_when(
      average_score >= 90 ~ "A",
      average_score >= 80 ~ "B",
      average_score >= 70 ~ "C",
      TRUE ~ "D"   ))

# Display final student results
print(students)


# ============================================================
# END OF TRAINING MATERIALS
# ============================================================
