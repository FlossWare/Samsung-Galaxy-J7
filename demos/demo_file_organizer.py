#!/usr/bin/env python3
"""
File Organizer Demo
Organizes files in a directory by type
"""

import os
import shutil
from pathlib import Path
from collections import defaultdict

def organize_files(directory):
    """Organize files in directory by extension"""

    # File type categories
    categories = {
        'Images': ['.jpg', '.jpeg', '.png', '.gif', '.bmp', '.svg'],
        'Documents': ['.pdf', '.doc', '.docx', '.txt', '.odt', '.md'],
        'Videos': ['.mp4', '.avi', '.mkv', '.mov', '.wmv'],
        'Audio': ['.mp3', '.wav', '.flac', '.m4a', '.ogg'],
        'Archives': ['.zip', '.tar', '.gz', '.rar', '.7z'],
        'Code': ['.py', '.js', '.java', '.cpp', '.c', '.html', '.css', '.sh'],
    }

    dir_path = Path(directory)
    if not dir_path.exists():
        print(f"❌ Directory not found: {directory}")
        return

    # Count files by category
    file_counts = defaultdict(int)

    print(f"\n📁 Organizing files in: {directory}\n")

    for file_path in dir_path.iterdir():
        if file_path.is_file():
            ext = file_path.suffix.lower()

            # Find category
            category = 'Other'
            for cat_name, extensions in categories.items():
                if ext in extensions:
                    category = cat_name
                    break

            # Create category folder
            category_dir = dir_path / category
            category_dir.mkdir(exist_ok=True)

            # Move file (in demo mode, we just print)
            new_path = category_dir / file_path.name
            print(f"  {file_path.name} → {category}/")
            file_counts[category] += 1

            # Uncomment to actually move files:
            # shutil.move(str(file_path), str(new_path))

    print(f"\n📊 Summary:")
    for category, count in sorted(file_counts.items()):
        print(f"  {category}: {count} files")

    print(f"\n💡 This is a dry run. Uncomment the shutil.move line to actually move files.\n")

if __name__ == '__main__':
    import sys

    if len(sys.argv) > 1:
        organize_files(sys.argv[1])
    else:
        print("""
╔══════════════════════════════════════════════════════════╗
║   File Organizer Demo 📁                                 ║
╚══════════════════════════════════════════════════════════╝

Usage:
  python demo_file_organizer.py /path/to/directory

Example:
  python demo_file_organizer.py ~/Downloads

This will organize files into folders by type:
  • Images (jpg, png, gif, etc.)
  • Documents (pdf, doc, txt, etc.)
  • Videos (mp4, avi, mkv, etc.)
  • Audio (mp3, wav, flac, etc.)
  • Archives (zip, tar, gz, etc.)
  • Code (py, js, html, etc.)
  • Other (everything else)
        """)
