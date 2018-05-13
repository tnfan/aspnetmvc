Controller is the one who will handle the user interaction Logic.

TestController is the class name whereas Test is the controller name.

What is Action Method?
Action method is simply a public method inside controller which accepts user’s request and returns some response.

Is it must to decorate action methods with public access modifier?
Yes, every public method will become action methods automatically.

What about non-public methods?
They are simply methods of a class and not available publicly . 
In simple words these methods can not be invoked from the web.

What if we want a method to be public but not action method?
Simply decorate it with [NonAction] attribute.

Understand Views in Asp.Net MVC
Most commonly the response is HTML as browser understands that format much better. 
HTML with some images, texts, Input controls etc. 
Normally in technical world layer defining the user interface design is termed as UI layer and in Asp.Net MVC it is termed as View.

For example: All the views related to Test controller will be placed inside “~/Views/Test” 
and Test controller can access only those views which are inside Test folder.

Can’t we reuse some of the views across multiple controllers?
Yes, we can. For that we will keep those files inside a special folder called “Shared”.

Note: In Asp.Net MVC views and controllers are not tightly coupled. 
One action method can refer more than one view and one view can be referred by more than one action method 
(by keeping them in Shared folder). It provides better reusability

ActionResult is the abstract class whereas ViewResult is the multi level child of ActionResult. Multilevel because, ViewResult is the child of ViewResultBase and ViewResultBase is the child of ActionResult.

Is it possible to invoke View function without Parameter?
Yes, then it will find the view with name “CurrentActionName”.

Passing Data from Controller to View
View will get data from the controller in the form of Model.

Model
In Asp.Net MVC model represent the business data.

ViewData is a dictionary, which will contains data to be passed between controller and views. 
Controller will add items to this dictionary and view reads from it. 

Convert data to ViewData
@{
        WebApplication1.Models.Employee emp=(WebApplication1.Models.Employee)
            ViewData["Employee"];
    }

What is the difference between writing Razor code with brace brackets (that is “{“ and “}”) and without brace brackets?
In the last lab @emp.FirstName can be replaced with following code snippet.
@{
	Response.Write(emp.FirstName);
}
@ Without brace brackets simply display the value of variable or expression.

Why casting is required?
ViewData holds objects internally. Every time a new value is added into it, it get boxed to object type.
So unboxing is required every time we try to extract value out of it.

Data Access Layer is one of the unspoken layer in Asp.Net MVC. It’s always there but never included in MVC definition.
Business layer as explained prior, it’s a part of Model.
NOTE: ViewData["Employee"] <=> ViewBag.Employee = emp;

ViewBag is just a syntactic sugar for ViewData. ViewBag uses the dynamic feature of C# 4.0 and makes ViewData dynamic.
ViewBag internally uses ViewData.

Problems with ViewData and ViewBag
ViewData and ViewBag is a good option for passing values between Controller and View. But in real time projects it’s not a good practice to use any of them. Let’s discuss couple of disadvantages of using ViewData and ViewBag.
+ Performance issues
Values inside the ViewData are of type Object. We have to cast the value to correct type before using it. It adds additional overhead on performance.
+No Type safety and no compile time errors
If we try to cast values to wrong type or if we use wrong keys while retrieving the values, we will get runtime error. As a good programming practice, error should be tackled in compiled time.
+No Proper connection between Data sent and Data Received
As a developer I personally found this as a major issue.
In MVC, controller and View are loosely connected to each other. Controller is completely unaware about what’s happening in View and View is unaware about what’s happening in Controller.
From Controller we can pass one or more ViewData/ViewBag values. Now when Developer writes a View, he/she have to remember what is coming from the controller. If Controller developer is different from View developer then it becomes even more difficult. Complete unawareness. It leads to many run time issues and inefficiency in development.

ViewData and ViewBag ==>strongly typed Views
@model WebApplication1.Models.Employee
or:
@using WebApplication1.Models
@model Employee
Now inside View simply type @Model and Dot (.) 
return View("MyView",emp);

Can we make our View a strongly typed view of more than one model?
No, we can’t

ViewModel is one of the unspoken layer in the Asp.Net MVC application. 
It fits between Model and View and act as data container for View

Difference between Model and ViewModel?
Model is Business specific data. It will be created based on Business and Database structure. 
ViewModel is View specific data. It will be created based on the View.

Every View will have its corresponding ViewModel.

as a best practice Model and ViewModel should be independent to each other.

We should always create ViewModel. Every view should always have its own ViewModel even if ViewModel is going to contain same properties as model.
Let’s say we have a situation where View won’t contain presentation logic and it want to display Model data as it is.Let’s assume we won’t create a ViewModelin this situation.
Problem will be, if in future requirement,ifwe have been asked to show some new data in our UI or if we asked to put some presentation logic we may end with complete new UI creation from the scratch.
So better if we keep a provision from the beginning and Create ViewModel. In this case, in the initial stage ViewModel will be almost same as Model.


