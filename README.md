# README
Parser tech test for Smart Pension: Partial solution

* Ruby version '2.6.0'


To set-up this project on a local machine:
1) Clone this repo
2) To install gems, in terminal run command:
   'bundle'


To run tests:
In terminal run command:
 'rspec'



 **User Stories:**

 ```
 As a user,
 So I can have my log files analysed
 I want the parser to be able to open and read log files
 ```

 ```
 # As a user,
 # So I know I have a valid file
 # I want to be notified with an error when the file cannot be read
 ```

 ```
 As a user,
 So I can see the number of times web pages have been visited
 I want to see a list of webpages ordered from most pages views to least
 ```


  ```
  As a user,
  So I can see the number of unique visits
  I want to see a list of webpages ordered from most unique visits to least
  ```

  *Approach:**
  ```
  In my approach to designing my solution for this tech test, I decided to design a command-line program with output to the terminal. This was done using a strict TDD process and was completed in 2.5 hours. The program has 100% test coverage. Given further time I would have focused on implementing the last feature, the unique views output. 
