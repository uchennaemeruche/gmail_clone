import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class Mail with ChangeNotifier{
  final String senderName, fromAddress, toAddress, subject, body, date, time;
  final bool hasAttachment;
  Color bgColor;

  Mail({this.senderName, this.fromAddress, this.toAddress, this.subject, this.body, this.date, this.time, this.hasAttachment, this.bgColor});

  int _currentIndex;

  int get currentMailIndex => _currentIndex ;

  set currentMailIndex(int currentIndex){
    _currentIndex = currentIndex;
    notifyListeners();
  }
}

List<Mail> mails = [
  Mail(
    senderName: "Sanya Oladele",
    fromAddress: "saynaola@gmail.com",
    toAddress: "emerucheuchenna@gmail.com",
    subject: "Filing Personal Income Tax Returns in Nigeria",
    body: "'The phone discussion between our Oladele Sanya and your Mr."
        " Umokoro Ransome on the above subject on mrch 30, 2020'",
    date: "6 Apr 2020",
    time: "9:07 am",
    hasAttachment: true
  ),
  Mail(
    senderName: "Felix Abyi",
    fromAddress: "felixab@gmail.com",
    toAddress: "emerucheuchenna@gmail.com",
    subject: "FLorem Ispum Check",
    body: '''
    
    
        Hello,
        
        Trust you are keeping safe.
        
        
        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
        labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris 
        nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit
        esse cillum dolore eu fugiat nulla pariatur
        Umokoro Ransome on the above subject on mrch''',
    date: "7 May 2020",
    time: "10:30 am",
    hasAttachment: false
  ),
  Mail(
      senderName: "Sanya Oladele",
      fromAddress: "saynaola@gmail.com",
      toAddress: "emerucheuchenna@gmail.com",
      subject: "Filing Personal Income Tax Returns in Nigeria",
      body: "'The phone discussion between our Oladele Sanya and your Mr."
          " Umokoro Ransome on the above subject on mrch 30, 2020'",
      date: "6 Apr 2020",
      time: "9:07 am",
      hasAttachment: true
  ),
  Mail(
    senderName: "Felix Abyi",
    fromAddress: "felixab@gmail.com",
    toAddress: "emerucheuchenna@gmail.com",
    subject: "FLorem Ispum Check",
    body: '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
        labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris 
        nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit
        esse cillum dolore eu fugiat nulla pariatur
        Umokoro Ransome on the above subject on mrch''',
    date: "7 May 2020",
    time: "10:30 am",
    hasAttachment: false
  ),
  Mail(
      senderName: "Sanya Oladele",
      fromAddress: "saynaola@gmail.com",
      toAddress: "emerucheuchenna@gmail.com",
      subject: "Filing Personal Income Tax Returns in Nigeria",
      body: "'The phone discussion between our Oladele Sanya and your Mr."
          " Umokoro Ransome on the above subject on mrch 30, 2020'",
      date: "6 Apr 2020",
      time: "9:07 am",
      hasAttachment: true
  ),
  Mail(
      senderName: "Felix Abyi",
      fromAddress: "felixab@gmail.com",
      toAddress: "emerucheuchenna@gmail.com",
      subject: "FLorem Ispum Check",
      body: '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
        labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris 
        nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit
        esse cillum dolore eu fugiat nulla pariatur
        Umokoro Ransome on the above subject on mrch''',
      date: "7 May 2020",
      time: "10:30 am",
      hasAttachment: false
  ),
  Mail(
      senderName: "Sanya Oladele",
      fromAddress: "saynaola@gmail.com",
      toAddress: "emerucheuchenna@gmail.com",
      subject: "Filing Personal Income Tax Returns in Nigeria",
      body: "'The phone discussion between our Oladele Sanya and your Mr."
          " Umokoro Ransome on the above subject on mrch 30, 2020'",
      date: "6 Apr 2020",
      time: "9:07 am",
      hasAttachment: true
  ),
  Mail(
      senderName: "Felix Abyi",
      fromAddress: "felixab@gmail.com",
      toAddress: "emerucheuchenna@gmail.com",
      subject: "FLorem Ispum Check",
      body: '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
        labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris 
        nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit
        esse cillum dolore eu fugiat nulla pariatur
        Umokoro Ransome on the above subject on mrch''',
      date: "7 May 2020",
      time: "10:30 am",
      hasAttachment: false
  ),
];