
class Timer
{
    float timeNow, timeLast, timeElapsed; //variables to measure the time passed
    float timeScale; //speed at which the time passed is calculated, default is 1
    float timePoint, timePointPosition;

    float timeLineDuration;
    float timeLineLength; //length of the timeline
    float timeLineDurationOffset;

    boolean countLoop;

    Timer(float loopLength, float loopRange, boolean cLoop)
    {
        timeNow = timeLast = timeElapsed = 0.0f;
        timeScale = 1.0f;

        timeLineLength = loopRange; //add the length of a box to the timeline
        timePoint = -timeLineDurationOffset;
        timeLineDuration = loopLength;

        countLoop = cLoop;
    }

    void update()
    {
        timeNow = millis();
        timeElapsed = (timeNow - timeLast) / 1000.0f * timeScale;
        timeLast = timeNow;

        timePoint += timeElapsed;

        //reset the timeLine 
        if(timePoint > timeLineDuration)
        {
            timePoint -= timeLineDuration;
            if(countLoop)
            {
                loopAmount ++;
            }
        }

        //calculate time indicator position on the timeline
        timePointPosition = (timePoint / timeLineDuration) * timeLineLength;
    }

    float getTime()
    {
        return timePointPosition;
    }

    void setSpeed(String tag)
    {
        switch(tag)
        {
            case "up":
                timeLineDuration -= 0.25f;
                if(timeLineDuration < 1.0f)
                    timeLineDuration = 1.0f;
                break;
            case"down":
                timeLineDuration += 0.25f;
                if(timeLineDuration > 15.0f)
                    timeLineDuration = 15.0f;
                break;
        }

    }
}
