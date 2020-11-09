import 'package:flutter/material.dart';

class MenuItem{
  final String itemName;
  final IconData icon;
  final int itemCount;

  MenuItem({this.itemName, this.icon, this.itemCount});
}

List<MenuItem> menuItems = [
  MenuItem(
    itemName: "All Inboxes",
    icon: Icons.collections_bookmark,
    itemCount: 101
  ),
  MenuItem(
    itemName: "Inbox",
    icon: Icons.book,
    itemCount: 0
  ),
  MenuItem(
    itemName: "Archive",
    icon: Icons.archive,
    itemCount: 0
  ),
  MenuItem(
    itemName: "Starred",
    icon: Icons.star_border,
    itemCount: 1
  ),
  MenuItem(
    itemName: "Unread",
    icon: Icons.markunread,
    itemCount: 0
  ),
  MenuItem(
    itemName: "Drafts",
    icon: Icons.drafts,
    itemCount: 0
  ),
  MenuItem(
    itemName: "Outbox",
    icon: Icons.all_out,
    itemCount: 0
  ),
  MenuItem(
    itemName: "Sent",
    icon: Icons.send,
    itemCount: 0
  ),
  MenuItem(
    itemName: "Bin",
    icon: Icons.delete_sweep,
    itemCount: 2
  ),
  MenuItem(
    itemName: "Spam",
    icon: Icons.info,
    itemCount: 0
  ),
];