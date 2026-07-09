import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import '/flutter_flow/custom_functions.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

List<dynamic> getReviews() {
  return [
    {
      "title": "New favorite workout app",
      "date": "13 Jul 2025",
      "name": "Akashumi",
      "text":
          "This is the first app that truly keeps me motivated. Clear guidance, lots of variety and real, noticeable results"
    },
    {
      "title": "🔥100%🔥",
      "date": "25 Jun 2025",
      "name": "afrokilla",
      "text": "For Everyone at any Age should try it out its just awsome!!!"
    },
    {
      "title": "Best Workout in the World 💪",
      "date": "26 Jun 2025",
      "name": "Chris.Moves",
      "text":
          "HIIT the Beat is the best Workout concept what i ever saw. The App is great to train with your Bodyweight for different Levels. You can choose a Warmup, Workout and Cool Down and do it everywhere you want 🤩 You will definitly get fitter, stronger, more mobility, stronger mindset! The Best: it is for every age and Fitness Level 🤩💪"
    },
    {
      "title": "Elevation!",
      "date": "1 Dec 2024",
      "name": "Blkstr_",
      "text":
          "This APP is absolutely phenomenal, very professional designed in a way that improves your strength and stamina with every time you train. Already can't wait to see my progress! Big up for the app founder and creator he has a supervision to change the whole training idea."
    },
    {
      "title": "Excited!",
      "date": "10 Dec 2024",
      "name": "Kamil Kozdra",
      "text":
          "I wholeheartedly recommend the hit the beat app. Very nicely done and mega great workouts. I loved this program 🔥🫶❤️💪"
    },
    {
      "title": "Best workout app",
      "date": "2 Sept 2025",
      "name": "Mozyaka1545@",
      "text":
          "This is my favorite fitness workout app ever! Unique, intensive, powerful workouts."
    },
    {
      "title": "Fun & Challenging",
      "date": "3 Dec 2024",
      "name": "jojocala",
      "text":
          "I love training with the app, it's so simple to use, the trainers are motivating and there are many cool workouts to choose from. I also love that you can choose different warm ups and cool downs, it just never gets boring and is customizable to fit any level. A must have for anyone who wants to get fit but also wants it to be fun!"
    },
    {
      "title": "HIIT the beat training app",
      "date": "27 Jul 2025",
      "name": "Golnaz f",
      "text":
          "This is amazing because you can do exercise no equipment and any level you can, easy to hard ⏸️⏹️▶️😜"
    },
    {
      "title": "Best Body weight workout",
      "date": "9 Feb 2025",
      "name": "Jess_Awake",
      "text":
          "A unique and fresh workout using your own body weight to the beat"
    },
    {
      "title": "New favorite workout app",
      "date": "13 Jul 2025",
      "name": "Akashumi",
      "text":
          "This is the first app that truly keeps me motivated. Clear guidance, lots of variety and real, noticeable results."
    },
    {
      "title": "Truly brilliant workout",
      "date": "21 Apr 2026",
      "name": "Karin Wallner",
      "text":
          "HIIT the Beat - THE brilliant workout 😀🔥 With the app and the Zoom workout jams offered here, you can train alone at home, on the go, or online in a group. Even I, as a HIIT the Beat trainer, love using the app. Regular training with the level system for the exercises results in a continuous improvement in your fitness level. No equipment needed - just your own body - truly brilliant 😀🔥☘️"
    },
    {
      "title": "Top-notch training structure",
      "date": "19 Apr 2026",
      "name": "Jessica Freise",
      "text":
          "Hiit the Beat is an incredibly engaging workout program, dynamically driving and incredibly fun, and also effective to the limit! The workouts in the app are brilliantly structured – making it easy to get started yet challenging, and the difficulty increases continuously! Top-notch! So go – Hiit the Beat!!!!"
    },
    {
      "title": "Hooked after the fitness expo",
      "date": "19 Apr 2026",
      "name": "Denise Simon",
      "text":
          "I discovered HIIT the Beat at a fitness expo and was immediately hooked. The concept is so much fun! The app is a great complement to the live classes. The structure is really well organized, so there's something for every fitness level. The explanations are easy to understand. The modular system adds variety to every workout! The music motivates you to push through even the most challenging exercises!"
    },
    {
      "title": "Stronger and more confident",
      "date": "18 Feb 2026",
      "name": "Cara",
      "text": "Finally I feel stronger, more confident & just good in my skin"
    },
    {
      "title": "Rediscovered the joy of movement",
      "date": "12 Mar 2026",
      "name": "Mirka, 69 years",
      "text":
          "HIIT the Beat helped me rediscover the joy of movement & became my foundation for staying fit"
    },
    {
      "title": "Moving like it",
      "date": "9 May 2026",
      "name": "Hai",
      "text": "From just looking good to moving like it"
    },
  ];
}
