# Smart Tourism Uttrakhand

An interactive website to discover hidden gems and popular tourist destinations across Uttrakhand. Explore beautiful regions, learn about attractions, and plan your perfect trip.

## 🎯 Features

- **Interactive Tourism Guide**: Explore attractions across Uttrakhand regions
- **Regional Coverage**: Detailed information about districts and areas:
  - Garhwal Region
  - Kumaon Region
  - Valley of Flowers
  - Rishikesh & Haridwar
- **Destination Guides**: Comprehensive information about tourist spots
- **Search & Filter**: Easy navigation to find specific attractions
- **Category Browse**: Filter by type (Religious, Adventure, Nature, Historical)
- **User-Friendly Interface**: Intuitive navigation and design
- **Responsive Layout**: Works seamlessly on all devices
- **Detailed Descriptions**: Rich information about each destination

## 🛠️ Tech Stack

- **Frontend**: HTML5, CSS3, JavaScript
- **Backend**: PHP
- **Database**: SQL/MySQL
- **Server**: Apache/Nginx

## 📋 Prerequisites

- Web server (Apache/Nginx)
- PHP 7.4 or higher
- MySQL/MariaDB database
- Modern web browser

## 🚀 Getting Started

1. Clone the repository:
   ```bash
   git clone https://github.com/Himanshu07123/smarttour-uttrakhnd.git
   cd smarttour-uttrakhnd
   ```

2. Set up your web server:
   - Copy files to your web root directory (htdocs for Apache)
   - Configure your virtual host

3. Set up the database:
   ```bash
   mysql -u root -p
   CREATE DATABASE uttrakhand_tourism;
   USE uttrakhand_tourism;
   SOURCE database.sql;
   ```

4. Configure database connection:
   - Edit `config/db_config.php` with your database credentials

5. Access the application:
   - Open `http://localhost/smarttour-uttrakhnd` in your browser

## 🗺️ Regions Covered

### **Garhwal Region**
- Dehradun
- Rishikesh
- Auli
- Chopta

### **Kumaon Region**
- Nainital
- Jim Corbett National Park
- Almora
- Kausani

### **Special Attractions**
- Valley of Flowers
- Kedarnath
- Badrinath
- Haridwar

## 📋 Database Schema

The application uses the following main tables:
- `destinations` - Tourist attractions and places
- `regions` - Uttrakhand regions and districts
- `categories` - Types of attractions
- `users` - User information (if needed)

## 🎮 How to Use

1. Browse regions and districts
2. Click on attractions to view details
3. Use search functionality to find specific places
4. Filter by category to narrow results
5. View maps and directions
6. Save favorite destinations

## 🔧 Configuration

- Database credentials in `config/db_config.php`
- Site settings in `config/settings.php`
- API keys for maps in `config/api_keys.php`

## 🎨 Customization

- Modify CSS in `css/` directory
- Update destination data in the database
- Add new regions or categories
- Customize the user interface

## 🤝 Contributing

Contributions are welcome! Please feel free to:
1. Fork the repository
2. Create a feature branch
3. Submit pull requests

## 📄 License

This project is licensed under the MIT License.

## 👤 Author

**Himanshu** - [GitHub Profile](https://github.com/Himanshu07123)

## 📞 Support

For issues or suggestions, please open an issue in the repository.

---

**Last Updated**: May 2026
