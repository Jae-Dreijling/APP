function calculateDaysBetweenDates(begin, end) {
    const beginDate = new Date(begin);
    const endDate = new Date(end);
    
    // Calculate the difference in milliseconds
    const diffInMs = endDate - beginDate;
    
    // Convert milliseconds to days
    const msInOneDay = 1000 * 60 * 60 * 24;
    const diffInDays = Math.floor(diffInMs / msInOneDay);
    
    return diffInDays;
}               