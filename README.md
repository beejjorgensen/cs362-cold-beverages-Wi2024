# Exam: A Refrigerator Simulator

This is a learning situation, to demonstrate your capabilities regarding testing.

## Setup

1. Fork this repo.

2. Outside your Docker container, in the same directory as your
   `compose.yml` file, clone the repository.

3. Edit `compose.yml`. You need to add the following line to the
   `volumes` section:

   ```
   - ./cs362-cold-beverages-Wi2024:/home/user/cs362-cold-beverages-Wi2024
   ```

4. Run the container. You should be able to see your
   `cs362-cold-beverages-Wi2024` directory in there

There is a _Gemfile_, so install the dependencies with `bundle install`.
The only dependency is rspec.

## Scenario

You have just taken over a legacy implementation of a refrigerator simulator.
There is an example program that "drives" the simulation. Run it:

```
ruby lib/driver.rb
```

You should see the output of the status of a single refrigerator: once while it
is empty and hasn't been plugged in, and then its status after being plugged in
and used.

Look at _lib/driver.rb_ to get a feel for how one can create refrigerator
components, assemble them to create a refrigerator, and use the refrigerator.

## What to do

Run the test suite.

```
rspec
```

You should see a handful of skipped tests and one failing test.

### Step 1

Read the tests in _spec/vessel_spec.rb_.

Take a look at which test is failing, and fix the implementation in
 _lib/vessel.rb_ to get the test to pass.

### Step 2

Focus on the remaining tests in _spec/vessel_spec.rb_. Perform a TDD workflow by
removing each `skip` and getting each test to pass by implementing new code in
_lib/vessel.rb_.

Ideally, be sure that all of your Vessel tests are passing before you continue
to **Step 3**.

### Step 3

**Note:** Be sure to leave yourself at least 20 minutes for **Step 4**.

Now, your goal is to examine this legacy codebase and get as much of it under
test as possible. There are many paths you may take, techniques you may use, and
there is probably more code to test than what you have time for. Make your decisions
and be methodical. One suggested order to pursue is:

- Item
- WaterDispenser
- WaterReservoir
- Freezer
- Chiller
- Refrigerator

Do not try to be too clever with your tests. Be methodical, straightforward, and
explicit.

### Step 4

Run the driver again. Notice how the water reservoir starts with "0 remaining"
and then after some simulated use reports that there is "-2 remaining". Look at
the code in _lib/driver.rb_, and look at the WaterReservoir class.

See if you can keep your test suite green while you:

1. Modify the behavior in either WaterDispenser or WaterReservoir, to prevent the
remaining volume of water from ever becoming negative. ("Where?" is a design
decision you have to make, and "How?" is your creative output.)
2. Test this new behavior you have introduced.
3. Modify the behavior in the WaterDispenser class to not only drain the reservoir
according to the volume of the vessel, but to also "fill" the vessel.
4. Test this new behavior you have introduced.

### Step 5

# Create a pull request.

&copy; 2021 Yong Bakos. All rights reserved.
