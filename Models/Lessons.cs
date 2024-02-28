//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace AutoSchoolTerminal.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Lessons
    {
        public int LessonID { get; set; }
        public int CourseID { get; set; }
        public int InstructorID { get; set; }
        public System.DateTime LessonDate { get; set; }
        public System.TimeSpan LessonTime { get; set; }
        public int DurationID { get; set; }
        public string Duration
        {
            get
            {
                int hours = DurationList.DurationOnMinutes / 60;
                int minutes = DurationList.DurationOnMinutes % 60;

                string hoursSuffix = hours == 1 ? "час" : (hours >= 2 && hours <= 4 ? "часа" : "часов");
                string minutesSuffix = minutes == 1 ? "минута" : "минут";

                if (minutes == 0)
                {
                    return $"{hours} {hoursSuffix}";
                }
                else
                {
                    return $"{hours} {hoursSuffix}, {minutes} {minutesSuffix}";
                }
            }
        }
        public virtual Courses Courses { get; set; }
        public virtual DurationList DurationList { get; set; }
        public virtual Instructors Instructors { get; set; }
    }
}
