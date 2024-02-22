//full body excersidses array
List<Map<String, dynamic>> exercisesArr = [
  {
    "name": "Set 1",
    "set": [
      {
        "image": "assets/img/warm up.webp",
        "title": "Warm Up",
        "value": "05:00",
        "description": "Gentle exercises to warm up your body.",
        "animation": "assets/img/jumping jack animation.gif",
        "calories": 30,
        "time": 05.00, // Approximate time for the set
      },
      {
        "image": "assets/img/jumping jack.jpg",
        "title": "Jumping Jack",
        "value": "12x",
        "description": "A jumping jack, also known as a star jump...",
        "animation": "assets/img/jumping jack animation.gif",
        "calories": 50,
        "time": 01.30, // Approximate time for the set
      },
      {
        "image": "assets/img/skipping.jpg",
        "title": "Skipping",
        "value": "15x",
        "description": "Skipping with a jump rope.",
        "animation": "assets/img/jumping jack animation.gif",
        "calories": 70,
        "time": 02.00, // Approximate time for the set
      },
      {
        "image": "assets/img/squats.jpg",
        "title": "Squats",
        "value": "20x",
        "description": "Perform squats to target your leg muscles.",
        "animation": "assets/img/jumping jack animation.gif",
        "calories": 60,
        "time": 02.30, // Approximate time for the set
      },
      {
        "image": "assets/img/Arm rises.jpg",
        "title": "Arm Raises",
        "value": "00:53",
        "description": "Raise your arms to engage shoulder muscles.",
        "animation": "assets/img/jumping jack animation.gif",
        "calories": 40,
        "time": 01.00, // Approximate time for the set
      },
      {
        "image": "assets/img/rest and drink.jpg",
        "title": "Rest and Drink",
        "value": "02:00",
        "description": "Take a break and stay hydrated.",
        "animation": "assets/img/jumping jack animation.gif",
        "calories": 10,
        "time": 02.00, // Approximate rest time
      },
    ],
  },
  {
    "name": "Set 2",
    "set": [
      {
        "image": "assets/img/rest and drink.jpg",
        "title": "Burpees",
        "value": "05:00",
        "description": "Start in a standing position, then squat down...",
        "animation": "assets/img/jumping jack animation.gif",
        "calories": 90,
        "time": 05.00, // Approximate time for the set
      },
      {
        "image": "assets/img/img_2.png",
        "title": "Plank to Tuck Jump",
        "value": "12x",
        "description": "Begin in a plank position, then jump your feet...",
        "animation": "assets/img/jumping jack animation.gif",
        "calories": 80,
        "time": 02.30, // Approximate time for the set
      },
      {
        "image": "assets/img/img_1.png",
        "title": "Russian Twists",
        "value": "15x",
        "description":
            "Sit on the floor with your knees bent and lean back slightly...",
        "animation": "assets/img/jumping jack animation.gif",
        "calories": 60,
        "time": 02.00, // Approximate time for the set
      },
      {
        "image": "assets/img/img_2.png",
        "title": "Dumbbell Rows",
        "value": "20x",
        "description": "Hold a dumbbell in each hand, hinge at the hips...",
        "animation": "assets/img/jumping jack animation.gif",
        "calories": 70,
        "time": 02.30, // Approximate time for the set
      },
      {
        "image": "assets/img/img_1.png",
        "title": "Mountain Climbers",
        "value": "00:53",
        "description":
            "Start in a plank position and bring one knee toward your chest...",
        "animation": "assets/img/jumping jack animation.gif",
        "calories": 50,
        "time": 01.30, // Approximate time for the set
      },
      {
        "image": "assets/img/img_2.png",
        "title": "Rest and Drink",
        "value": "02:00",
        "description": "Take a break and stay hydrated.",
        "animation": "assets/img/jumping jack animation.gif",
        "calories": 10,
        "time": 02.00, // Approximate rest time
      },
    ],
  },
];

//
//lowerbody excersise array
List<Map<String, dynamic>> lowerBodyWorkoutArr = [
  {
    "name": "Set 1",
    "set": [
      {
        "image": "assets/img/img_1.png",
        "title": "Bodyweight Squats",
        "value": "15x",
        "description":
            "Stand with feet shoulder-width apart. Lower your body by bending your knees and hips, then return to the starting position.",
        "animation": "assets/img/squat_animation.gif",
        "calories": 50, // Calories burned for Bodyweight Squats
        "time": 02.00, // Approximate time for the set
      },
      {
        "image": "assets/img/img_1.png",
        "title": "Forward Lunges",
        "value": "12x per leg",
        "description":
            "Take a step forward with one leg, lower your body until both knees are bent at a 90-degree angle. Return to the starting position and switch legs.",
        "animation": "assets/img/lunge_animation.gif",
        "calories": 40, // Calories burned for Forward Lunges
        "time": 01.30, // Approximate time for the set
      },
      {
        "image": "assets/img/img_1.png",
        "title": "Romanian Deadlifts",
        "value": "15x",
        "description":
            "Hold a barbell or dumbbells in front of your thighs. Hinge at your hips, keeping your back straight, and lower the weights towards the ground, then return to the starting position.",
        "animation": "assets/img/deadlift_animation.gif",
        "calories": 60, // Calories burned for Romanian Deadlifts
        "time": 02.00, // Approximate time for the set
      },
      {
        "image": "assets/img/img_1.png",
        "title": "Calf Raises",
        "value": "20x",
        "description":
            "Stand on a flat surface and lift your heels as high as possible by pushing through the balls of your feet. Lower back down and repeat.",
        "animation": "assets/img/calf_raise_animation.gif",
        "calories": 30, // Calories burned for Calf Raises
        "time": 01.30, // Approximate time for the set
      },
      {
        "image": "assets/img/img_1.png",
        "title": "Rest and Drink",
        "value": "02:00",
        "description": "Take a break and prepare for the next set.",
        "time": 02.00, // Approximate rest time
      },
    ],
  },
  {
    "name": "Set 2",
    "set": [
      {
        "image": "assets/img/img_1.png",
        "title": "Glute Bridges",
        "value": "15x",
        "description":
            "Lie on your back with knees bent, lift your hips towards the ceiling, squeezing your glutes at the top. Lower back down and repeat.",
        "animation": "assets/img/glute_bridge_animation.gif",
        "calories": 30, // Calories burned for Glute Bridges
        "time": 01.30, // Approximate time for the set
      },
      {
        "image": "assets/img/img_1.png",
        "title": "Step-Ups",
        "value": "12x per leg",
        "description":
            "Step onto a sturdy platform with one foot, driving through the heel to lift your body up. Step back down and repeat on the other leg.",
        "animation": "assets/img/step_ups_animation.gif",
        "calories": 45, // Calories burned for Step-Ups
        "time": 02.00, // Approximate time for the set
      },
      {
        "image": "assets/img/img_1.png",
        "title": "Wall Sit",
        "value": "1:00",
        "description":
            "Sit against a wall with your knees bent at a 90-degree angle. Hold the position, engaging your quadriceps and glutes.",
        "animation": "assets/img/wall_sit_animation.gif",
        "calories": 20, // Calories burned for Wall Sit
        "time": 01.00, // Approximate time for the set
      },
      {
        "image": "assets/img/img_1.png",
        "title": "Lateral Leg Raises",
        "value": "15x per leg",
        "description":
            "Lie on your side and lift your top leg towards the ceiling, engaging your outer thigh. Lower back down and repeat on the other side.",
        "animation": "assets/img/lateral_leg_raise_animation.gif",
        "calories": 25, // Calories burned for Lateral Leg Raises
        "time": 01.30, // Approximate time for the set
      },
      {
        "image": "assets/img/img_1.png",
        "title": "Rest and Drink",
        "value": "02:00",
        "description": "Take a break and stay hydrated.",
        "time": 02.00, // Approximate rest time
      },
    ],
  },
];

//
//AB workout array
List<Map<String, dynamic>> abWorkoutArr = [
  {
    "name": "Set 1",
    "set": [
      {
        "image": "assets/img/img_1.png",
        "title": "Crunches",
        "value": "20x",
        "description":
            "Lie on your back with knees bent, hands behind your head...",
        "animation": "assets/img/crunch_animation.gif",
        "calories": 40,
        "time": 02.00, // Assuming 2 minutes for the set
      },
      {
        "image": "assets/img/img_1.png",
        "title": "Bicycle Crunches",
        "value": "15x per side",
        "description":
            "Lie on your back, lift your legs, and bring one knee towards your chest...",
        "animation": "assets/img/bicycle_crunch_animation.gif",
        "calories": 60,
        "time": 01.30, // Assuming 1.5 minutes for the set
      },
      {
        "image": "assets/img/img_1.png",
        "title": "Plank",
        "value": "1:00",
        "description":
            "Start in a plank position, keeping your body in a straight line...",
        "animation": "assets/img/plank_animation.gif",
        "calories": 50,
        "time": 01.00, // Assuming 1 minute for the set
      },
      {
        "image": "assets/img/img_1.png",
        "title": "Leg Raises",
        "value": "15x",
        "description":
            "Lie on your back with legs straight. Lift your legs towards the ceiling...",
        "animation": "assets/img/leg_raise_animation.gif",
        "calories": 45,
        "time": 02.00, // Assuming 2 minutes for the set
      },
      {
        "image": "assets/img/img_1.png",
        "title": "Rest and Drink",
        "value": "02:00",
        "description": "Take a break and prepare for the next set.",
        "calories": 10,
        "time": 02.00, // Assuming 2 minutes for the rest
      },
    ],
  },
  {
    "name": "Set 2",
    "set": [
      {
        "image": "assets/img/img_1.png",
        "title": "Mountain Climbers",
        "value": "30s",
        "description":
            "Start in a plank position and bring one knee towards your chest...",
        "animation": "assets/img/mountain_climber_animation.gif",
        "calories": 55,
        "time": 00.30, // Assuming 30 seconds for the set
      },
      {
        "image": "assets/img/img_1.png",
        "title": "Russian Twists",
        "value": "20x",
        "description":
            "Sit on the floor, lean back slightly, and twist your torso...",
        "animation": "assets/img/russian_twists_animation.gif",
        "calories": 50,
        "time": 01.30, // Assuming 1.5 minutes for the set
      },
      {
        "image": "assets/img/img_1.png",
        "title": "Lying Leg Twists",
        "value": "15x per side",
        "description":
            "Lie on your back with legs lifted. Lower your legs to one side...",
        "animation": "assets/img/lying_leg_twist_animation.gif",
        "calories": 55,
        "time": 01.30, // Assuming 1.5 minutes for the set
      },
      {
        "image": "assets/img/img_1.png",
        "title": "Plank Jacks",
        "value": "20x",
        "description":
            "Start in a plank position and jump your legs wide, then back together...",
        "animation": "assets/img/plank_jacks_animation.gif",
        "calories": 60,
        "time": 02.00, // Assuming 2 minutes for the set
      },
      {
        "image": "assets/img/img_1.png",
        "title": "Rest and Drink",
        "value": "02:00",
        "description": "Take a break and stay hydrated.",
        "calories": 10,
        "time": 02.00, // Assuming 2 minutes for the rest
      },
    ],
  },
];
