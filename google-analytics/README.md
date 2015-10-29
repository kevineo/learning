# Google Analytics

# Video Tutorials
Link: https://www.youtube.com/watch?v=s4R5WWWg2Vk
Link 2: https://www.youtube.com/watch?v=qtSo2ERAF18

# Primary Focus
## 1) Using Javascript to link
    1. Provides statistical data for website performance.
    2. Tracks events like click, buy, exit, new user and existing user.

## 2) General focus
    1. E-commerce: sell products  / services
    2. Lead: collect user information
    3. Content Publishing: encourage repeat visits
    4. Branding: drive awareness and review engagement

# Terms
## Attribution
Assigning credits for sales and conversion.

## Conversion
A completed activity that you deemed important to your goal.

## Dimension
Describes characteristics of a piece of data

## Event
An action that is tracked when user performs action

## Goal
User to track discrete action and their value

## Hit
An interaction that sends data to Google Analytics

## Metric
An individual element of dimension that can be sum or ratio.

## Page View
When a page is loaded or reloaded in the browser

## Segment
Sub-set of user shares common attributes.

## Session
Period of time a user is active on your site. The default is 30 min.

## Source / Medium
The source is the origin of traffic; Medium is the category of source.


# Usual Activity
## Setup
1. Use Real-Time active user to test Google Analytics integration. It should not be 0 if you're visiting the web during the testing.
2. Create Tag using Tag manager for your initial analysis.
3. Setup basic filter like force lowercase URL etc.

## Reports
### Audience
provides insights, who, the device they use, their interest and their location

### Acquisition
reveal where your user comes

### Behavior
how user interact with the website

### Conversion
demonstrate how to convert.

## Goal Settings
### Setting up cohort and goal
1. To track the impact for new changes

### Real Time Monitoring
1. To watch real-time execution and immediate effects

## Custom Tracking
### URL construction (UTM Tracking)
> **NOTE**:
> Avoid spaces to simplify URL construction. Try to name your campaign name with '-' or '_'.


1) Add a question mark (parameter tracking)
```
    http://mysite.com/?
```


2) Add a source parameter
```
    # The source is 'utm_source='
    http://mysite.com/?utm_source=twitter
```


3) Add a medium by expanding analytics using '&' sign
```
    # The source is 'utm_medium='
    http://mysite.com/?utm_source=twitter&utm_medium=social
```


4) Add a tracking campaign using '&' sign as expansion
```
    # The source is 'utm_campaign=< campaign name >'
    http://mysite.com/?utm_source=twitter&utm_medium=social&utm_campaign=offer
```


5) More info and params on https://support.google.com/analytics/answer/1033867?hl=en