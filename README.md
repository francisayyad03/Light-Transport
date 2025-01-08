## Overview
This project implements a **2D light propagation simulation** using ray tracing techniques. The simulation models light rays interacting with various materials (mirrors, scattering surfaces, and refractive objects) and handles reflections, refractions, and scattering based on the material properties.

## Features
- **Ray Generation**: Light rays are generated from various sources, including point lights and lasers.
- **Material Interactions**:
  - **Mirrors**: Rays reflect perfectly based on the angle of incidence.
  - **Scattering Surfaces**: Rays scatter randomly within ±90° of the surface normal.
  - **Refractive Materials**: Rays split into reflected and refracted components, calculated using **Snell's Law** and **Schlick's Approximation**.
- **Closest Intersection**: Finds the closest intersection point between a ray and scene objects (walls or circular objects).
- **Rendering**: Rays are rendered on a 2D plane to visualize light propagation.

## Code Structure
### Key Functions
- **`makeLightSourceRay()`**: Generates light rays from the source, with directions varying based on the light type.
- **`propagateRay()`**: Recursively propagates light rays through the scene, handling interactions with materials.
- **`intersectRay()`**: Calculates the intersection of a ray with walls or circular objects, returning the closest intersection point.

### Materials and Objects
- Walls and objects in the scene are defined with attributes such as material type and refractive index.
- Ray interactions are computed to simulate realistic light behavior.

## Requirements
- **C Compiler**: A C compiler like GCC to compile the code.
