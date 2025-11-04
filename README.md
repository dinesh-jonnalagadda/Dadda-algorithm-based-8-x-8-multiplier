# Dadda-algorithm-based-8-x-8-multiplier
The Dadda algorithm is a fast multiplication technique used in digital hardware, especially in high-speed arithmetic circuits. It reduces the number of partial products efficiently and arranges them in a tree structure to minimize the required number of addition stages. It’s similar to the Wallace tree, but Dadda's method is more optimized and uses fewer hardware resources, making it power- and area-efficient.

( This project contains the files created during the process of making a semi-custom design of 8 bit dadda algorithm using cadence tools. )


Key points :

| Feature          | Explanation                                              |
| ---------------- | -------------------------------------------------------- |
| Input size       | 8×8 multiplier                                           |
| Partial products | 64 bits                                                  |
| Technique        | Minimum adders, staged compression                       |
| Adders used      | Full adders & half adders                                |
| Final stage      | CPA for 2-row sum                                        |
| Benefit          | Faster than array multiplier, less hardware than Wallace |



This project implements an efficient 8×8 Dadda multiplier by :

   *   Generating 64 partial products

   *   Reducing matrix height in controlled stages (6 → 4 → 3 → 2)

   *   Using only Full/Half adders for compression

   *   Producing final 16-bit output using structured carry propagation

✅ Why Dadda Algorithm ?

   *   Uses fewer adders compared to Wallace multipliers

   *   Maintains high speed with controlled wiring complexity

   *   Ideal for VLSI / ASIC / FPGA implementations

   *   Demonstrates deep structural digital logic handling


✅ Why dadda algorithm multiplier is considered among other multipliers  ?

| Feature          | **     Dadda Multiplier     **          | Wallace Tree                         | Array Multiplier            | Booth Multiplier                            |
| ---------------- | --------------------------------------- | ------------------------------------ | --------------------------- | ------------------------------------------- |
| Key Idea         | Optimized partial-product reduction     | Aggressive partial-product reduction | Direct summation array      | Encoded multiplication to reduce operations |
| Speed            | **Very High**                           | Very High                            | Low                         | Medium-High                                 |
| Hardware Usage   | **Moderate (optimized)**                | High                                 | Low                         | Medium                                      |
| Area Requirement | **Low-Medium**                          | High                                 | **Lowest**                  | Medium                                      |
| Routing & Layout | **Better structured, easier placement** | Complex routing                      | Very regular                | Moderate                                    |
| Best Use Case    | **Speed + Area balance (ASIC/VLSI)**    | Maximum speed priority               | Low-cost, low-power designs | Signed multiplication & DSP                 |


🧠 Dadda Reduction Stages (8×8 Multiplier) 

| Stage           | Operation                       | Goal Height      | What Happens in Code                                            |
| --------------- | ------------------------------- | ---------------- | --------------------------------------------------------------- |
| **Stage-0**     | **Partial Product Generation**  | 8 → input matrix | `pp[i] = A & {8{B[i]}};`                                        |
| **Stage-1**     | First compression               | Reduce to ≤ 6    | First layer of **HA/FA** to shrink tallest columns              |
| **Stage-2**     | Second compression              | Reduce to ≤ 4    | Deeper **FA chain** to bring product matrix height further down |
| **Stage-3**     | Final partial-product reduction | Reduce to ≤ 3    | Remaining **FA/HA** to get only 2 rows                          |
| **Final Stage** | Final addition                  | 2 → 1            | Ripple/CPA add: `assign P = row1 + row2;`                       |

