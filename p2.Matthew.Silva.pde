// Delcaring positions for each icon and setting sizes
int weatherX, weatherY, weatherSize = 400;
int calendarX, calendarY, calendarSize = 300;
int newsX, newsY, newsSize = 300;
int healthX, healthY, healthSize = 300;
int timeX, timeY, timeSize = 80;
int backX, backY, backSize = 80;
int flashLightX, flashLightY, flashLightSize = 300;
int yellowX, yellowY, yellowSize = 100;
int orangeX, orangeY, orangeSize = 100;

String condition, condition1, event, info, exerciseType;
int high, low, history, light, deep, standing, exercise;

// Initializing clock time
float seconds = 20, minutes = 10, hours = 23;

// Declares colors for icon backgrounds
color weatherColor, calendarColor, newsColor, healthColor, timeColor, colColor, flashLightColor, orangeColor, yellowColor;

// Variables to store png images
PImage imgWeather, imgCalendar, imgNews, imgHealth, imgPortrait, imgLight;

JSONObject json;
JSONObject day, type;
JSONObject weeklyForecast;
JSONObject calendar, news, health;

boolean weatherOver = false;
boolean backOver = false;
boolean calendarOver = false;
boolean weatherPressed = false;
boolean backPressed = false;
boolean calendarPressed = false;
boolean newsOver = false;
boolean newsPressed = false;
boolean healthOver = false;
boolean healthPressed = false;
boolean flashLightPressed = false;
boolean flashLightOver = false;
boolean orangePressed = false;
boolean yellowPressed = false;
boolean orangeOver = false;
boolean yellowOver = false;

void setup(){
  size(900, 900);
  frameRate(1);
    
  weatherColor = color(102);
  timeColor = color(0);
  colColor = color(0);
  calendarColor = color(102);
  newsColor = color(102);
  healthColor = color(102);
  flashLightColor = color(102);
  orangeColor = color(255, 165, 0);
  yellowColor = color(255, 255, 0);
  
  imgWeather = loadImage("weather.png");
  imgCalendar = loadImage("calendar-icon.png");
  imgNews = loadImage("news.png");
  imgHealth = loadImage("Health-icon.png");
  imgPortrait = loadImage("portrait.png");
  imgPortrait.resize(900, 900);
  imgLight = loadImage("light.png");
  
  weatherX = 50;
  weatherY = 650;
  
  backX = 715;
  backY = 800;
  
  calendarX = 50;
  calendarY = 340;
  
  newsX = 50;
  newsY = 50;
  
  healthX = 750;
  healthY = 50;
  
  flashLightX = 750;
  flashLightY = 340;
  
  orangeX = 450;
  orangeY = 670;
  
  yellowX = 550;
  yellowY = 670;
}

void draw(){
  update(mouseX, mouseY);
  background(imgPortrait);
  
  json = loadJSONObject("weather.json");
  calendar = loadJSONObject("calendar.json");
  news = loadJSONObject("news.json");
  health = loadJSONObject("health.json");
  
  // Day one weather
  day = json.getJSONObject("Today");
  condition = day.getString("Weather");
  high = day.getInt("high");
  low = day.getInt("low");  
  
  seconds+=1;
  
  // Handles time changing
  if(seconds == 60){
    seconds = 0;
    minutes +=1;
  }
  if(minutes == 60){
    minutes = 0;
    hours +=1;
  }
  if(hours == 24){
    hours = 0;
    minutes = 0;
    seconds = 0;
  }
  
  // Displays time to screen
  textSize(50);
  fill(timeColor);
  text(floor(seconds), 220, 825);
  text(floor(minutes), 140, 825);
  text(floor(hours), 60, 825);
  
  // Displays colons to screen for time
  ellipse(130, 800, 8, 8);
  ellipse(130, 820, 8, 8);
  ellipse(210, 800, 8, 8);
  ellipse(210, 820, 8, 8);
  
  // Box that holds weather and time
  pushStyle();
  fill(weatherColor, 102);
  rect(weatherX, weatherY, weatherSize/1.5, weatherSize/2);
  //tint(0, 153, 204, 126);
  imgWeather.resize(100, 100);
  image(imgWeather, 60, 660);
  popStyle();
  
  imgCalendar.resize(100, 100);
  image(imgCalendar, 50, 340);
  
  imgNews.resize(100, 100);
  image(imgNews, 50, 50);
  
  imgHealth.resize(100, 100);
  image(imgHealth, 750, 50);
  
  imgLight.resize(100, 100);
  image(imgLight, 750, 340);
  
  if(weatherPressed){
    pushStyle();
    stroke(0);
    strokeWeight(3);
    fill(255, 102);
    rect(120, 100, weatherSize*1.7, weatherSize*1.2);
    popStyle();
    
    pushStyle();
    fill(timeColor);
    textSize(20);
    text("Today: \n" + condition + ", High: " + high + ", Low: " + low, 150, 125);
    popStyle();
    
    // Day two weather
    day = json.getJSONObject("Tomorrow");
    condition = day.getString("Weather");
    high = day.getInt("high");
    low = day.getInt("low");  
    
    pushStyle();
    fill(timeColor);
    textSize(20);
    text("Tomorrow: \n" + condition + ", High: " + high + ", Low: " + low, 150, 200);
    popStyle();
    
    // 7-Day forecast
    weeklyForecast = json.getJSONObject("7-Day Forecast");
    condition = weeklyForecast.getJSONObject("Today").getString("Weather");
    high = weeklyForecast.getJSONObject("Today").getInt("high");
    low = weeklyForecast.getJSONObject("Today").getInt("low");
    
    pushStyle();
    fill(timeColor);
    textSize(20);
    text("7-Day Forecast: \n" + condition + ", High: " + high + ", Low: " + low, 150, 275);
    popStyle();
    
    //weeklyForecast = json.getJSONObject("Thursday");
    condition = weeklyForecast.getJSONObject("Thursday").getString("Weather");
    high = weeklyForecast.getJSONObject("Thursday").getInt("high");
    low = weeklyForecast.getJSONObject("Thursday").getInt("low");
    
    pushStyle();
    fill(timeColor);
    textSize(20);
    text("    Thursday: \n    " + condition + ", High: " + high + ", Low: " + low, 150, 350);
    popStyle();
    
    condition = weeklyForecast.getJSONObject("Friday").getString("Weather");
    high = weeklyForecast.getJSONObject("Friday").getInt("high");
    low = weeklyForecast.getJSONObject("Friday").getInt("low");
    
    pushStyle();
    fill(timeColor);
    textSize(20);
    text("    Friday: \n    " + condition + ", High: " + high + ", Low: " + low, 150, 425);
    popStyle();
    
    condition = weeklyForecast.getJSONObject("Saturday").getString("Weather");
    high = weeklyForecast.getJSONObject("Saturday").getInt("high");
    low = weeklyForecast.getJSONObject("Saturday").getInt("low");
    
    pushStyle();
    fill(timeColor);
    textSize(20);
    text("    Saturday: \n    " + condition + ", High: " + high + ", Low: " + low, 150, 500);
    popStyle();
    
    condition = weeklyForecast.getJSONObject("Sunday").getString("Weather");
    high = weeklyForecast.getJSONObject("Sunday").getInt("high");
    low = weeklyForecast.getJSONObject("Sunday").getInt("low");
    
    pushStyle();
    fill(timeColor);
    textSize(20);
    text("    Sunday: \n    " + condition + ", High: " + high + ", Low: " + low, 500, 300);
    popStyle(); //<>//
    
    condition = weeklyForecast.getJSONObject("Monday").getString("Weather");
    high = weeklyForecast.getJSONObject("Monday").getInt("high");
    low = weeklyForecast.getJSONObject("Monday").getInt("low");
    
    pushStyle();
    fill(timeColor);
    textSize(20);
    text("    Monday: \n    " + condition + ", High: " + high + ", Low: " + low, 500, 375);
    popStyle();
    
    condition = weeklyForecast.getJSONObject("Tuesday").getString("Weather");
    high = weeklyForecast.getJSONObject("Tuesday").getInt("high");
    low = weeklyForecast.getJSONObject("Tuesday").getInt("low");
    
    pushStyle();
    fill(timeColor);
    textSize(20);
    text("    Tuesday: \n    " + condition + ", High: " + high + ", Low: " + low, 500, 450);
    popStyle();
    
    condition = weeklyForecast.getJSONObject("Wednesday").getString("Weather");
    high = weeklyForecast.getJSONObject("Wednesday").getInt("high");
    low = weeklyForecast.getJSONObject("Wednesday").getInt("low");
    
    pushStyle();
    fill(timeColor);
    textSize(20);
    text("    Wednesday: \n    " + condition + ", High: " + high + ", Low: " + low, 500, 525);
    popStyle();
    
    // Back button
    pushStyle();
    fill(timeColor);
    textSize(20);
    text("Back", 737, 827);
    popStyle();
    
    pushStyle();
    fill(weatherColor, 102);
    rect(backX, backY, backSize, backSize/2);
    popStyle();
    
    // back button pressed
    if(backPressed){
     weatherPressed = false;
     backPressed = false;
     calendarPressed = false;
     newsPressed = false;
     healthPressed = false;
     flashLightPressed = false;
     orangePressed = false;
     yellowPressed = false;
    }
    backPressed = false;
    calendarPressed = false;
    newsPressed = false;
    healthPressed = false;
    flashLightPressed = false;
    orangePressed = false;
    yellowPressed = false;
  }
  
  if(calendarPressed){ //<>//
    
    // Display calendar box
    pushStyle(); //<>//
    stroke(0);
    strokeWeight(3);
    fill(255, 102);
    rect(200, 250, calendarSize*1.5, calendarSize);
    popStyle();
    
    day = calendar.getJSONObject("Today");
    event = day.getString("Events");
    
    pushStyle();
    fill(timeColor);
    textSize(20);
    text("Today: \n" + event, 250, 275);
    popStyle();
    
    day = calendar.getJSONObject("Tomorrow");
    event = day.getString("Events");
    
    pushStyle();
    fill(timeColor);
    textSize(20);
    text("Tomorrow: \n" + event, 250, 350);
    popStyle();
    
    pushStyle();
    fill(timeColor);
    textSize(20);
    text("Back", 737, 827);
    popStyle();
    
    pushStyle();
    fill(weatherColor, 102);
    rect(backX, backY, backSize, backSize/2);
    popStyle();
    
    // back button pressed
    if(backPressed){
     calendarPressed = false;
     backPressed = false;
     weatherPressed = false;
     newsPressed = false;
     healthPressed = false;
     flashLightPressed = false;
     orangePressed = false;
     yellowPressed = false;
    }
    backPressed = false;
    weatherPressed = false;
    newsPressed = false;
    healthPressed = false;
    flashLightPressed = false;
    orangePressed = false;
    yellowPressed = false;
  }
  
  if(newsPressed){
    // displays news box
    pushStyle();
    stroke(0);
    strokeWeight(3);
    fill(255, 102);
    rect(50, 250, newsSize*2.5, newsSize*1.2);
    popStyle();
    
    day = news.getJSONObject("Today");
    info = day.getString("News");
    
    pushStyle();
    fill(timeColor);
    textSize(15);
    text("Today: \n" + info, 100, 270);
    popStyle();
    
    day = news.getJSONObject("TodayNext");
    info = day.getString("More News");
    
    pushStyle();
    fill(timeColor);
    textSize(15);
    text("\n" + info, 100, 320);
    popStyle();
    
    pushStyle();
    fill(timeColor);
    textSize(20);
    text("Back", 737, 827);
    popStyle();
    
    pushStyle();
    fill(weatherColor, 102);
    rect(backX, backY, backSize, backSize/2);
    popStyle();
    
    
    // back button pressed
    if(backPressed){
     newsPressed = false;
     backPressed = false;
     calendarPressed = false;
     weatherPressed = false;
     healthPressed = false;
     flashLightPressed = false;
     orangePressed = false;
     yellowPressed = false;
    }
    backPressed = false;
    weatherPressed = false;
    calendarPressed = false;
    healthPressed = false;
    flashLightPressed = false;
    orangePressed = false;
    yellowPressed = false;
  }
  if(healthPressed){
    // displays health box
    pushStyle();
    stroke(0);
    strokeWeight(3);
    fill(255, 102);
    rect(200, 75, healthSize*1.5, healthSize);
    popStyle();
    
    type = health.getJSONObject("Sleep");
    history = type.getInt("Hours Slept");
    light = type.getInt("Light");
    deep = type.getInt("Deep");
    
    pushStyle();
    fill(timeColor);
    textSize(20);
    text("Sleep: " + history + ", Light: " + light + ", Deep: " + deep, 220, 100);
    popStyle();
    
    type = health.getJSONObject("Weekly Sleep");
    history = type.getInt("Total Hours");
    
    pushStyle();
    fill(timeColor);
    textSize(20);
    text("Weekly Sleep: " + history, 220, 150);
    popStyle();
    
    type = health.getJSONObject("Current Weight");
    history = type.getInt("Weight");
    
    pushStyle();
    fill(timeColor);
    textSize(20);
    text("Current Weight: " + history, 220, 200);
    popStyle();
    
    type = health.getJSONObject("Total Steps");
    history = type.getInt("Steps");
    standing = type.getInt("Hours Standing");
    
    pushStyle();
    fill(timeColor);
    textSize(20);
    text("Total Steps: " + history + ", Hours standing: " + standing, 220, 250);
    popStyle();
    
    type = health.getJSONObject("Exercise");
    exerciseType = type.getString("Type");
    exercise = type.getInt("Hours Spent");
    
    pushStyle();
    fill(timeColor);
    textSize(20);
    text("Exercise Type: " + exerciseType + ", Hours spent: " + exercise, 220, 300);
    popStyle();
    
    pushStyle();
    fill(timeColor);
    textSize(20);
    text("Back", 737, 827);
    popStyle();
    
    pushStyle();
    fill(weatherColor, 102);
    rect(backX, backY, backSize, backSize/2);
    popStyle();
    
    
    // back button pressed
    if(backPressed){
     newsPressed = false;
     backPressed = false;
     calendarPressed = false;
     weatherPressed = false;
     healthPressed = false;
     flashLightPressed = false;
     orangePressed = false;
     yellowPressed = false;
    }
    backPressed = false;
    weatherPressed = false;
    newsPressed = false;
    calendarPressed = false;
    flashLightPressed = false;
    orangePressed = false;
    yellowPressed = false;
  }
  if(flashLightPressed){
    // displays flashlight box
    pushStyle();
    stroke(0);
    strokeWeight(3);
    fill(255, 102);
    rect(25, 25, flashLightSize*2.85, flashLightSize*2.8);
    popStyle();
    
    pushStyle();
    stroke(0);
    strokeWeight(3);
    fill(orangeColor);
    rect(450, 670, orangeSize, orangeSize);
    //rect(550, 670, yellowSize, yellowSize);
    popStyle();
    
    pushStyle();
    stroke(0);
    strokeWeight(3);
    fill(yellowColor);
    rect(550, 670, yellowSize, yellowSize);
    popStyle();
    
    pushStyle();
    fill(timeColor);
    textSize(20);
    text("Back", 737, 827);
    popStyle();
    
    pushStyle();
    fill(flashLightColor, 102);
    rect(backX, backY, backSize, backSize/2);
    popStyle();
    
    // back button pressed
    if(backPressed){
     newsPressed = false;
     backPressed = false;
     calendarPressed = false;
     weatherPressed = false;
     healthPressed = false;
     flashLightPressed = false;
     orangePressed = false;
     yellowPressed = false;
    }
    
    backPressed = false;
    weatherPressed = false;
    newsPressed = false;
    calendarPressed = false;
    healthPressed = false;
    orangePressed = false;
    yellowPressed = false;
  }
  if(orangePressed){
    // displays orange color
      pushStyle();
      stroke(0);
      strokeWeight(3);
      fill(orangeColor, 102);
      rect(25, 25, flashLightSize*2.85, flashLightSize*2.8);
      popStyle();
      
      pushStyle();
      stroke(0);
      strokeWeight(3);
      fill(orangeColor);
      rect(450, 670, orangeSize, orangeSize);
      //rect(550, 670, yellowSize, yellowSize);
      popStyle();
      
      pushStyle();
      stroke(0);
      strokeWeight(3);
      fill(yellowColor);
      rect(550, 670, yellowSize, yellowSize);
      popStyle();
      
      pushStyle();
      fill(timeColor);
      textSize(20);
      text("Back", 737, 827);
      popStyle();
      
      pushStyle();
      fill(flashLightColor, 102);
      rect(backX, backY, backSize, backSize/2);
      popStyle();
      
      // back button pressed
      if(backPressed){
       newsPressed = false;
       backPressed = false;
       calendarPressed = false;
       weatherPressed = false;
       healthPressed = false;
       flashLightPressed = false;
       orangePressed = false;
       yellowPressed = false;
      }
      
      backPressed = false;
      weatherPressed = false;
      newsPressed = false;
      calendarPressed = false;
      healthPressed = false;
      //orangePressed = false;
      yellowPressed = false;
  }
  if(yellowPressed){
    // displays yellow color
      pushStyle();
      stroke(0);
      strokeWeight(3);
      fill(yellowColor, 102);
      rect(25, 25, flashLightSize*2.85, flashLightSize*2.8);
      popStyle();
      
      pushStyle();
      stroke(0);
      strokeWeight(3);
      fill(orangeColor);
      rect(450, 670, orangeSize, orangeSize);
      //rect(550, 670, yellowSize, yellowSize);
      popStyle();
      
      pushStyle();
      stroke(0);
      strokeWeight(3);
      fill(yellowColor);
      rect(550, 670, yellowSize, yellowSize);
      popStyle();
      
      pushStyle();
      fill(timeColor);
      textSize(20);
      text("Back", 737, 827);
      popStyle();
      
      pushStyle();
      fill(flashLightColor, 102);
      rect(backX, backY, backSize, backSize/2);
      popStyle();
      
      // back button pressed
      if(backPressed){
       newsPressed = false;
       backPressed = false;
       calendarPressed = false;
       weatherPressed = false;
       healthPressed = false;
       flashLightPressed = false;
       orangePressed = false;
       yellowPressed = false;
      }
      
      backPressed = false;
      weatherPressed = false;
      newsPressed = false;
      calendarPressed = false;
      healthPressed = false;
      orangePressed = false;
      //yellowPressed = false;
  }
}

void update(int x, int y){
  if(overWeather(weatherX, weatherY, weatherSize, weatherSize)){
    weatherOver = true;
    calendarOver = false;
    backOver = false;
    newsOver = false;
    healthOver = false;
    flashLightOver = false;
    orangeOver = false;
    yellowOver = false;
  }
  else if(overBack(backX, backY, backSize, backSize)){
    backOver = true;
    weatherOver = false;
    calendarOver = false;
    newsOver = false;
    healthOver = false;
    flashLightOver = false;
    orangeOver = false;
    yellowOver = false;
  }
  else if(overCalendar(calendarX, calendarY, calendarSize, calendarSize)){
    calendarOver = true;
    backOver = false;
    weatherOver = false;
    newsOver = false;
    healthOver = false;
    flashLightOver = false;
    orangeOver = false;
    yellowOver = false;
  }
  else if(overNews(newsX, newsY, newsSize, newsSize)){
    newsOver = true;
    weatherOver = false;
    backOver = false;
    calendarOver = false;
    healthOver = false;
    flashLightOver = false;
    orangeOver = false;
    yellowOver = false;
  }
  else if(overHealth(healthX, healthY, healthSize, healthSize)){
    healthOver = true;
    weatherOver = false;
    backOver = false;
    calendarOver = false;
    newsOver = false;
    flashLightOver = false;
    orangeOver = false;
    yellowOver = false;
  }
  else if(overFlashLight(flashLightX, flashLightY, flashLightSize, flashLightSize)){
    flashLightOver = true;
    weatherOver = false;
    backOver = false;
    calendarOver = false;
    newsOver = false;
    healthOver = false;
    orangeOver = false;
    yellowOver = false;
  }
  else if(overOrange(orangeX, orangeY, orangeSize, orangeSize)){
    orangeOver = true;
    flashLightOver = false;
    weatherOver = false;
    backOver = false;
    calendarOver = false;
    newsOver = false;
    healthOver = false;
    yellowOver = false;
  }
  else if(overYellow(yellowX, yellowY, yellowSize, yellowSize)){
    yellowOver = true;
    flashLightOver = false;
    weatherOver = false;
    backOver = false;
    calendarOver = false;
    newsOver = false;
    healthOver = false;
    orangeOver = false;
  }
}

void mouseClicked(){
  if(weatherOver){
      weatherPressed = true;
      backPressed = false;
      calendarPressed = false;
      newsPressed = false;
      healthPressed = false;
      flashLightPressed = false;
      orangePressed = false;
      yellowPressed = false;
  }
  else if(backOver){
      backPressed = true;
      weatherPressed = false;
      calendarPressed = false;
      newsPressed = false;
      healthPressed = false;
      flashLightPressed = false;
      orangePressed = false;
      yellowPressed = false;
  }
  else if(calendarOver){
    calendarPressed = true;
    weatherPressed = false;
    backPressed = false;
    newsPressed = false;
    healthPressed = false;
    flashLightPressed = false;
    orangePressed = false;
    yellowPressed = false;
  }
  else if(newsOver){
    newsPressed = true;
    calendarPressed = false;
    weatherPressed = false;
    backPressed = false;
    healthPressed = false;
    flashLightPressed = false;
    orangePressed = false;
    yellowPressed = false;
  }
  else if(healthOver){
    healthPressed = true;
    newsPressed = false;
    calendarPressed = false;
    weatherPressed = false;
    backPressed = false;
    flashLightPressed = false;
    orangePressed = false;
    yellowPressed = false;
  }
  else if(flashLightOver){
    flashLightPressed = true;
    newsPressed = false;
    calendarPressed = false;
    weatherPressed = false;
    backPressed = false;
    healthPressed = false;
    orangePressed = false;
    yellowPressed = false;
  }
  else if(orangeOver){
    orangePressed = true;
    flashLightPressed = false;
    newsPressed = false;
    calendarPressed = false;
    weatherPressed = false;
    backPressed = false;
    healthPressed = false;
    yellowPressed = false;
  }
  else if(yellowOver){
    yellowPressed = true;
    flashLightPressed = false;
    orangePressed = false;
    newsPressed = false;
    calendarPressed = false;
    weatherPressed = false;
    backPressed = false;
    healthPressed = false;
  }
}

boolean overWeather(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

boolean overBack(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

boolean overCalendar(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

boolean overNews(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

boolean overHealth(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

boolean overFlashLight(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

boolean overOrange(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

boolean overYellow(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}
