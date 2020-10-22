# PassAuth - the Password Manager Mobile Application

PassAuth is a Password manager Hybrid Application developed using a Flutter Framework. This Application made with a basis of Hive database(NoSQL database) which will save the data in mobile itself. This application will save the user id and password of  all the website by users data and  fetched by using MASTERKEY(a key that will be used to fetch, delete, update the application).

## Explanation

  
  This first page is the login page which will accept login-id in mail format. Initially this page will make create you a master key in which you can access the saved data.
  
  ![screenshot1](https://user-images.githubusercontent.com/47808523/96906485-7c2fa500-14b7-11eb-9d23-3414663c343c.jpeg)

  Below page will ask you for master key to get you into home page where you can save the data of login details.
  
  ![screenshot2](https://user-images.githubusercontent.com/47808523/96906882-142d8e80-14b8-11eb-9f48-19b7ca76b5ad.jpeg)

  This is your home page where the right bottom FloatingActionButton will help you to add the login field to the list.
  
  ![screenshot3](https://user-images.githubusercontent.com/47808523/96906905-198ad900-14b8-11eb-9276-a10da914fdae.jpeg)
  
  This is a showDialog widget where you can add the login details of the various websites. 
  
  ![screenshot4](https://user-images.githubusercontent.com/47808523/96906924-1f80ba00-14b8-11eb-9118-e27614909d8a.jpeg)

  If you want to delete or access the login detail of the website. You must enter the MasterKey to see the data.
  The details of login will be shown only if the MasterKey is correct. otherwise it will send you a toast message. 
  the delete button in the above page will also need the same kind of MasterKey verification.
  
  ![screenshot5](https://user-images.githubusercontent.com/47808523/96906949-260f3180-14b8-11eb-8606-b30d788c841f.jpeg)

  below shown page is the final details page where you can see the login detail of the particular ListTile.

  ![screenshot6](https://user-images.githubusercontent.com/47808523/96906974-33c4b700-14b8-11eb-98e7-832ce6957b6e.jpeg)
 
  


