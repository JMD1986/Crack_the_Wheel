#uml:

##Cheese
* has many reviews
* has many likes

##User
* have many reviews
* has many likes

##Farm/producer
* have many cheese
* have many likes

##reviews

##likes

#Models

##cheese
*name:
*style:
  *fresh
  *bloomy rind/soft ripened
  *washed rind
  *firm
  *semi soft
  *hard
  *blue
*type of milk: optional
*where it was made: optional

##user
 * first_name:
 * last_name:
 * username: optional
 * location:
 * email:
 * has secure password

 ##farm
  * location
  * name
  * likes
  * reviews
  * bio: optional

##Wheels(likes)
*  whether they liked it or not

##reviews
 * cheese
 * text
 * a review equals a like automatically

## feature creep:
* badges!
* add another table for shops so users within a certain location can see shops that have cheese they might like!
