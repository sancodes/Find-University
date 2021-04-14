<h1> Find University </h1>

<h2> Table of Contents: </h2>
<ul>
<li> <a href="#gm"> General Information </a> </li>
<li> <a href="#tech"> Technologies </a> </li>


</ul>

<div id="gm">
<h3> Overview </h3>
<p> 
Application that allows you to save your your favorite university across the globe.
</p>
<h4> Initial Planning </h4>
<h4> Snapshots </h4>
<ul>
<li> Schema Design </li>
<p> Single model to store the result getting from API call.</p> <br>
<img src="/images/universitySchema.png" align="center">
<br>
<br>
<li> Application Design </li>
<ul>
<li> Follows MVC architecture
<li> <strong>Model</strong>: Salesforce Data Model
<ul>
<li> Data model is simple and contains single schema and will save and retrieve data from Salesforce Database </li>
</ul>
<br>
<li> <strong>View</strong>: Aura Lightning Web Component
<ul>
<li> Data is rendered through Aura and CSS and SLDS is used for styling </li>
</ul>
<br>
<li> <strong>Controller</strong>: JavaScript and Apex
<ul>
<li> Apex is responsible for retrieving and passing HTTP requests data to JavaScript Controller</li>
<li> JavaScript controller is responsible for passing the user input from front end to the backend Apex and also data binding to the Aura. Apex is responsible for fetching API via HTTP request and also interacting with the database.  </li>
</ul>
</ul>
<br>
<img src="/images/backendDesign.png" align="center">
</ul>
<br>
<br>
<li> Application Prototype </li>
<p> Used Salesforce Digital Experience Site to work with UI. It made choosing colors, working with button functionalities and page display easier </p> <br>
<img src="/images/prototype.png" align="center">
<br>
<br>
<h4>  Application Functionality </h4>
<ul> 
    <li> User should be able to search universities by typing countries name, and able to save the university in the database for future reference. </li>
</ul>
</div>
<div id="tech">
<h3> Tools Used </h3>
<ul>
    <li> Apex </li>
    <li> Aura Lightning Web Component </li>
    <li> HTML </li>
    <li> CSS </li>
    <li> JavaScript </li>
    <li> Salesforce Database </li>
    <li> Salesforce Lightning Design System(SLDS) </li>
</ul>
    



