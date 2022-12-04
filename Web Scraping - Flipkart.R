#robotstxt - to get permission, connectivity, etc.....
#rvest - to take the HTML scrapper point
#stringr - editing strings
library(robotstxt)
library(rvest)
library(stringr)

#Website to be scraped
url <- "https://www.flipkart.com/6bo/b5g/~cs-2svzdcnmc7/pr?sid=6bo%2Cb5g&collection-tab-name=Gaming&ctx=eyJjYXJkQ29udGV4dCI6eyJhdHRyaWJ1dGVzIjp7InRpdGxlIjp7Im11bHRpVmFsdWVkQXR0cmlidXRlIjp7ImtleSI6InRpdGxlIiwiaW5mZXJlbmNlVHlwZSI6IlRJVExFIiwidmFsdWVzIjpbIkdhbWluZyBMYXB0b3BzIl0sInZhbHVlVHlwZSI6Ik1VTFRJX1ZBTFVFRCJ9fX19fQ%3D%3D&wid=23.productCard.PMU_V2_1/"

#Allowance
path = paths_allowed(url)

#HTML elements from website
web <- read_html(url)

#Extracting names of laptops
Name <- web %>% html_nodes("._4rR01T") %>%html_text()
View(Name)

#Extracting price
Price <- web %>% html_nodes("._1_WHN1") %>%html_text()

#Removing Rupee (₹) symbol
Price <- str_remove_all(Price,"₹")
View(Price)

#Extracting rating
Rating <- web %>% html_nodes("._1lRcqv ._3LWZlK") %>%html_text()
View(Rating)

#Extracting specs
Specs <- web %>% html_nodes(".rgWa7D:nth-child(1)") %>%html_text()
View(Specs)

#Creating dataframe
flipkart <- data.frame(Name, Price, Rating, Specs)
View(flipkart)

#Saving data as .csv
write.csv(flipkart,"flipkart_laptops.csv")
