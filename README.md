Flutter sample app submitted by Mufeeda Ck

##TASK:

One main screen, with a search box and button at the top. You can enter any search term, which would be sent to the Pixabay images API (https://pixabay.com/api/docs/). You need to create a free account to get an API key.
The API you need to access is https://pixabay.com/api/?key={ KEY }&q={ SEARCH_TERM
}&image_type=photo

The resulting images would then be loaded and displayed in a scrollable list/grid in the same activity, below the search box. You should be able to click an image to view it full screen.
You can use open source libraries of your choice.

You will need to implement lazy loading (loading more images while scrolling).

If possible use Getx for the state management, no minus points if you use other state management solutions.

##APP DESCRIPTION:

#Screens:
1. Home Screen:- Search box with lazy load list view of images
2. Image Full Screen view:- opened when click a list tile of home screen list view

#External Libraries Used:

provider: for state management
lazy_load_scrollview: to implement lazy loading
photo_view: to view full screen image
