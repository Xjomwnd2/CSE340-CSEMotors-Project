-- Create database tables for CSE Motors

-- Create classification table
CREATE TABLE IF NOT EXISTS public.classification (
  classification_id SERIAL PRIMARY KEY,
  classification_name VARCHAR(50) NOT NULL
);

-- Create inventory table
CREATE TABLE IF NOT EXISTS public.inventory (
  inv_id SERIAL PRIMARY KEY,
  inv_make VARCHAR(50) NOT NULL,
  inv_model VARCHAR(50) NOT NULL,
  inv_year INTEGER NOT NULL,
  inv_description TEXT NOT NULL,
  inv_image VARCHAR(200) NOT NULL,
  inv_thumbnail VARCHAR(200) NOT NULL,
  inv_price DECIMAL(10,2) NOT NULL,
  inv_miles INTEGER NOT NULL,
  inv_color VARCHAR(50) NOT NULL,
  classification_id INTEGER NOT NULL,
  FOREIGN KEY (classification_id) REFERENCES classification (classification_id) ON DELETE CASCADE
);

-- Create account table
CREATE TABLE IF NOT EXISTS public.account (
  account_id SERIAL PRIMARY KEY,
  account_firstname VARCHAR(20) NOT NULL,
  account_lastname VARCHAR(30) NOT NULL,
  account_email VARCHAR(320) NOT NULL UNIQUE,
  account_password VARCHAR(255) NOT NULL,
  account_type account_type NOT NULL DEFAULT 'Client'
);

-- Create account type enum
CREATE TYPE account_type AS ENUM ('Client', 'Employee', 'Admin');

-- Insert sample classification data
INSERT INTO public.classification (classification_name) VALUES
('Custom'),
('Sport'),
('SUV'),
('Truck'),
('Sedan');

-- Insert sample inventory data
INSERT INTO public.inventory (
  inv_make, inv_model, inv_year, inv_description, inv_image, inv_thumbnail,
  inv_price, inv_miles, inv_color, classification_id
) VALUES
-- Custom vehicles
('DMC', 'Delorean', 1981, 'Oh what a car! This car was made famous in the "Back to the Future" movie franchise. This car features a stainless steel body panels and can go back in time! Flux capacitor not included.', '/images/vehicles/delorean.jpg', '/images/vehicles/delorean-tn.jpg', 37990, 2100, 'Brushed Stainless', 1),

-- Sport vehicles  
('Lamborghini', 'Adventador', 2016, 'This V-12 engine packs a punch in this sporty car. Make sure you wear saftey glasses and sunscreen when you drive it. A 0-60 mph in 2.9 seconds makes this car go fast.', '/images/vehicles/lambo-adventador.jpg', '/images/vehicles/lambo-adventador-tn.jpg', 417650, 71003, 'Blue', 2),
('Aston Martin', 'DB11', 2017, 'James Bond''s ride of choice features a V-12 engine and top-notch performance. This car rental will have you up and down dale hills with the best of them.', '/images/vehicles/aston-martin-db11.jpg', '/images/vehicles/aston-martin-db11-tn.jpg', 239900, 11400, 'Silver', 2),

-- SUV vehicles
('Monster', 'Hummer', 1998, 'This Hummer gets 9 miles per gallon and comes with a warn label for the environment. With 6 wheels, it has been set up for desert racing and as a second home. A/C takes 60 minutes to cool down the car.', '/images/vehicles/hummer.jpg', '/images/vehicles/hummer-tn.jpg', 58800, 56564, 'Yellow', 3),

-- Truck vehicles
('Chevy', 'Model-T', 1913, 'The original car affordable car that put cars into the hands of common people. This car revolutionized assembly line production. The green color was the only color the car came in originally.', '/images/vehicles/model-t.jpg', '/images/vehicles/model-t-tn.jpg', 30000, 26000, 'Black', 4),

-- Sedan vehicles
('Jeep', 'Wrangler', 2019, 'The Jeep Wrangler is an ongoing vehicle line that traces its heritage back to World War II and has been called the most capable SUV ever.', '/images/vehicles/jeep-wrangler.jpg', '/images/vehicles/jeep-wrangler-tn.jpg', 31895, 24900, 'Orange', 3);

-- Create indexes for better performance
CREATE INDEX IF NOT EXISTS idx_inventory_classification 
ON public.inventory(classification_id);

CREATE INDEX IF NOT EXISTS idx_account_email 
ON public.account(account_email);