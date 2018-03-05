# MemeGenerator
A Meme Generator demo App to iOS using imgflip API
Show 100 memes ordered by how many times they were captioned in the last 30 days. Source: List https://api.imgflip.com

## To Do List

- [x] Initial config project and dependency manager
 - [x] Config router and networking Memes API
- [x] Tests to networking
- [x] Create Reusable Cells Class and Nib for list memes
- [x] Create Controller an Views for show memes list
- [x] Create Reusable Cells Class and Nib for details meme
- [x] Create Controller an Views for show details meme
- [x] Enable update texts for meme
- [x] Enable facebook sharing
- [x] Enable twitter sharing

# Requirements

- iOS 11
- Xcode 9.3+
- Swift 4

## Features

* Displays a list of memes for viewing
* You can select a meme and see the image of the complete meme 
* It allows to edit two texts in the meme
* Share your modified memes on Facebook
* Share your modified memes on Twitter

## Architecture

This application has been developed following the MVC pattern.
Unitary tests have been implemented for the models and in the logic of call networking to evaluate the correct response of the Web services.
In this application, the delegation has been done through Closures and the link through protocols to implement decoupling the instances and facilitate the implementation of the tests

## Installation

### Get started
* Clone or Download the branch master
* On the root folder run $ open AppT.xcworkspace


