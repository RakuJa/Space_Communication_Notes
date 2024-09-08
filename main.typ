
#import "template.typ": *

// Take a look at the file `template.typ` in the file panel
// to customize this template and discover how it works.
#show: project.with(
  title: "Space communication systems",
  subtitle: "",
  subject: "Notes",
  guide: (
    name: "Filippo Giannetti",
    designation: "Professor of Space Communication Systems",
    department: "Information Engineering"
  ),
  authors: (
    (
      name: "Daniele Giachetto", 
      department: "Department of Information Engineering",
      rollno: "647820"
    ),
    (
      name: "X",
      department: "Department of Aereospace Engineering",
      rollno: "x",
    ),
  ),
  department: "Department of Aereospace Engineering",
  institute: "Università degli studi di Pisa",
  degree: "Master of Science",
  year: "2023-2024",
  logo: "images/logo-unipi.png",
)


= Introduction

== Rationale
Since this is a subject typically addressed by post-graduate masters, with a lot of notions taken from complex subjects, there is no official text book to study. These notes aim at structuring the lectures in the forms of notes. There was little to no effort in making these notes "book like", they are a collection of annotations and knowledge. 

== Notations

In this course, we'll #strong("always") use the metric system, avoiding the imperial system. This is done to avoid conversion errors and to use a more logical and "scientific" system. 

=== A lesson to be learned
The Mars Climate Orbiter, a robotic space probe launched by NASA to Mars on the 11th of December 1998, while it was beginning the planned orbital insertion manouver, communication was permanently lost. The spacecraft passed behind Mars 49 seconds earlier than expected, and communication was never reestablished, causing mission loss.
This mission loss was caused entirely by mixing imperial and international unit of measures. The lesson: *always use the international system, avoid imperial units*

    #figure(
      image("images/introduction/SI_and_prefixes.png", width: 100%),
      caption: [The International System of units (SI) and its prefixes]
    )<SI_and_prefixes>

#pagebreak()

== Definitions
A #text("communication system", green) is a collection of elements that allows an exchange of signals carrying information between two stations: a #text("Trasmitter", blue) (often abbreaviated to #text("TX", blue)) and a #text("Receiver (Rx)", red).
#line()
#text("Transducers", green) is the generic term for sensors & actuators. 
To simplify, we have:

input device #sym.arrow.r sensors #sym.arrow.r source of electrical signal

output device #sym.arrow.r actuators #sym.arrow.r source of physical signal
#line()
We assume that the physical quantities are converted into electrical signals by means of special devices, named #text("Transducers", red).
A #text("signal", green) is a function of the time that conveys information about a phenomenon by means of a physical quantity. A signal is a time-varying voltage, periodic with period T#sub[0].
if $ v(t) = v(t+t#sub[0]) ∀t$ we define foundamental frequency as $ f#sub[0] = frac(1, T#sub[0]) $

Power Dissipated (P)
$ P = V*I = V^2/R = I^2*R$

We would also like to calculate to Root Mean Square of the current, to determine the amount of power/strength of the signal:
$ P = V^2#sub[RMS]/R #sym.arrow.r V#sub[RMS] = sqrt(P*R)$


$ P#sub[dBW] = 10* log (P#sub[w])/(1#sub[w])$

Energy of a generic signal over an interval of duration #sym.tau: 
$ E#sub[s] [J] = integral^(#sym.tau/2)_(-#sym.tau/2) p(t) d t= P#sub[s] * #sym.tau $

Energy of a periodic signal over one period of duration T#sub[0]:
$ E#sub[s] [J] = integral^((T#sub[0])/2)_(-(T#sub[0])/2) p(t) d t= P#sub[s] * T#sub[0] $

== Signals & Fourier analysis
Fourier analysis helps us represent a given signal as a sum of signals.  In the case of random signals it produces a function denoted as #text("Power Spectral Density (PSD)", red)
#line()
Bandwith of a signal refers to the portion of the frequency domain where the spectrum is significantly different from zero after a linear transformation, a signal changes its PSD

$x(t)[v] #sym.arrow.r G(f) #sym.arrow.r y(t)[v] $

$S#sub[x] (f) W/(H#sub[Z]) #sym.arrow.r #sym.arrow.r  #sym.arrow.r S#sub[Y] (f) [W/(H#sub[Z])] = G(f) * S#sub[x] (f) W/(H#sub[Z])$
#line()

=== Noise
Random noise is usually rapresented with a gaussian distribution. White noise on the other hand draws its name from "white" light: white light is approximately an equal mixture of all visible frequencies of light. It's an ideal model, because it has "infinite" integral #sym.arrow.r infinite power.
    #figure(
      image("images/introduction/White_Noise_PSD.png", width: 50%),
      caption: [PSD of White Gaussian Noise (ideal)]
    )<White_Noise_PSD>

In practice, white noise does not exist. No system is capable of generating a uniform spectrum for all frequencies extended from zero to infinity, so we refer to an upper-limited frequency range.
    #figure(
      image("images/introduction/White_Noise_PSD_real.png", width: 60%),
      caption: [PSD of White Gaussian Noise (real)]
    )<White_Noise_PSD>

=== Filter
We have three main type of filters:
- Low-Pass filter: it will filter frequencies above a certain threshold from the input signal
- High-Pass filter: it will filter frequencies belove a certain threshold from the input signal
- Band-Pass filter: it will filter out frequencies above and belove a given range. It is divided in Wide and Narrow, according to the Q-factor.

=== Power
Power gain & power losses are linear equation, so you can just sum or subtract if they are in the same logarithmic scale. Coaxial cables tend to act as a low pass filter after some distances. 

= Regulations
== International bodies
- ITU: International Telecommunication Union, is the UN specialized agency for information and communication technologies based in Geneva.
  - ITU-R: radiocommunication sector
  - ITU-T: telecommunication standardization sector
  - ITU-D: telecommunication development sector
  The work is mainly driven by the private sector, all major companies are members of the ITU and they partecipate on equal footing with governaments.
  - ITU-RR: The ITU Radio Regulation are binding international treaties approved by ITU member states which govern the global use of radio frequency spectrum (applies also to satellites) and satellite orbits.
  - ITU-WTC: (World Radiocommunication conference) is a conference held every 3/4 years by ITU to review radio regulations.
== Rest of the globe
- Europe:
  - ETSI: (European Telecommunications Standards Institute) leading standardization organization for Information and Communication Technology (ICT). Initially intended for Europe, now operates on a global scale;
  - CENELEC: (Committee for Electrotechnical Standardisation) standardization in the electrotechnical engineering fields;
  - EBU: (European Brodcasting Union).
- Italy:
  - Ministero delle imprese.
- USA:
  - FCC (Federal Communications Commission).
- Other:
  - IEEE (Institute of Electrical and Electronics Engineers);
  - IEEE/SA (IEEE/Standars Association);
  - 3GPP (3rd Generation Partnership Project) Responsable for 2G, 3G, 4G, 5G;
  - DVB/DUBS2 (Digital Video Broadcasting).
- Space:
  - UNOOSA (United Nations Office for Outer Space Affairs) Promotes international cooperation in the peaceful use and exploration of space, and in the utilisation of space science and technology for sustainable economic and social development;
  - ECSS (European Cooperation for Space Standardization) ;
  - SFCG (Space Frequency Coordination Group) Deals with frequency management issues relevant to the activity of the various space agencies. It was established in order to provide a less formal and more flexible environment, as compared to the official organs of the ITU;
  - CCDS (Consultative Committee for Space Data Systems) multi-national forum for the development of communications & data systems standards for spaceflight;
  - IDSIS (International Deep Space Interoperability Standards) is a partnership among all the agencies involved in ISS operations: NASA, Roscosmos, JAXA, ESA, CSA.

= Earth Atmosphere

    #figure(
      image("images/introduction/atmosphere_comp.PNG", width: 120%),
      caption: [Earth atmosphere]
    )<Earth_atmosphere>  

    A rain droplet is shaped like a bean and not like a sphere, as such it interferes (attenuates) more with horizontaly polarized waves.

    O#sub[2] is almost constant meaning that we can predict it. It interferes with noticable spikes at 60 & 120 Ghz.

    H#sub[2]O interferes with spikes at 22 & 180 Ghz, but its also highly variable. Water at certain frequencies is eager to capture electron to complete its structure, attenuating the signal.

    Refractive index is relative low after 20km and it measures the slow down of electromagnetic waves. 

    Snell's law also says that light (E.M rad) bends and changes direction when traveling through different mediums. This happens when traveling through each layer of the atmosphere bending randomly\* the signal (\*according to micro variation of temperature, humidity, etc..). 

    #figure(
      image("images/introduction/snell_law.PNG", width: 55%),
      caption: [Snell's law and Earth atmosphere]
    )<snell_law>  

#pagebreak()
    == Ionosphere
    It is located in the range of 80 to 400 km. The ISS sits just outside of it.
    The radiation from external sources hits and charges (positively or negatively) particles with high variability. Some external factors: inclination on the axis (season), presence of sun (day/night), latitude, sun spots, solar flares, etc.. .

    Ionosphere layers are D, E, F. E was the first layer discovered, called like this because it reflected back electricity sent at it. F is divided in F1, F2 during the day and D is present only during the day. Low frequencies are reflected (< 20 Mhz), high frequencies pass.
    For space communications we'll always use at least 50 Mhz. We can also use the ionosphere to bounce signal around the globe.  

    #figure(
      image("images/introduction/ionosphere.PNG", width: 120%),
      caption: [Earth ionosphere]
    )<Earth_ionosphere>  

= Frequency bands

We use mainly from microwaves onward (microwaves + millimiter waves)

    #figure(
      image("images/introduction/bands.PNG", width: 120%),
      caption: [Frequency bands]
    )<Frequency_bands>

We use Ku and Ka band because they are just outiside the range of interferences with water and oxygen found in the Earth atmosphere. There is also a Q/V frequency band (40-75 Ghz) that is highly experimental, we have hard attenuation above 60 Ghz inside the atmosphere, but we could use those frequencies outside of it.

The various bands presented, are inside divided in:
- Uplink frequency range;
- Downlink frequency range;
- Deep space uplink frequency range;
- Deep space downlink frequency range.

== Pros and cons of the most used bands

C band has wide footprint, minor effect from rain (the larger the wavelength the less problems with rain), low cost. But it also requires big antennas.

Ku-band has smaller antennas but have small footprint and are more affected by rain.

Ka-band has, comparing with Ku-band, smaller antennas, smaller footprint and are more affected by rain. It also introduces high costs.

Remember: Antenna size gets smaller as the frequency gets higher but at the same time, to properly focus the beam we'll have a relatively (to the wavelength) big antenna dish.


= Antennas

At least 10° inclination  to avoid ground noises & obstacles. 

An antenna can be a transmitting antenna or receiver or both. It can also be called transducer.

== Isotropic & Directional antennas.

Isotropic radiator is a theoretical point which radiates with the same intensity in all directions (Not ideal, it wastes a lot of power). A#sub[e] =   $λ^2 / (4pi) $. With λ = wavelength.

*2D* (not 3D) isotropic radiators are used for radio TV broadcasting.

*3D* are used for theoretical comparison to determine the figure of merit of the antenna OR for space comms (backup/emergency antenna).

Directional antennas are used to avoid wasting power and concentrate the radiated power. Obviously shifting a signal from radial to directional increases the strength in the desired direction and reduces drastically in all the others.

    #figure(
      image("images/introduction/isotropic.PNG", width: 100%),
      caption: [Isotropic and directional antennas]
    )<isotropic_and_directional_antennas>

== Antenna Area.

Beamwidth is the width of the beam , it determines how precise the accuracy must be between Tx and Rx. Making it bigger we lower the required accuracy but we lose gain.

The antenna effective area is the measure of how effective an antenna is at collecting the power of electromagnetic radiation. The antenna area is smaller than the physical area $ A#sub[e] = η A#sub[p] $ with η being the efficiency factor and η < 1.

If a signal enters the dish and hits the edge, it may scatter and create interference.  
Many practical antennas have circular aperture #sym.arrow.r $ A#sub[p] = (pi⌀^2)/4; A#sub[e]=η((pi⌀^2)/4); G#sub[max] = η((pi⌀)/λ)^2$

== Dipoles

Dipoles are used for low-gain antennas.

    #figure(
      image("images/introduction/dipole.PNG", width: 80%),
      caption: [Dipole antennas]
    )<dipole_antennas>

The quarter-wave dipole, with the mirror is the same as half-wave dipole but we compacted and saved space. We can use crossed dipoles to approximated isotropic radiator and we can place various dipole lineearly to increase reach and have narrower beam. We can also combine colinear arrays with reflectors to increase gain.

    #figure(
      image("images/introduction/dipole_beam.PNG", width: 80%),
      caption: [Linearly placed dipoles beam (colinear arrays)]
    )<linearly_placed_dipole_beam>

== Waveguide
Waveguides are hollow metallic structures for transmitting electromagnetics energy from source to load in a bounded medium (like a pipe)

    #figure(
      image("images/introduction/types_of_waveguide.PNG", width: 80%),
      caption: [Various types of waveguides]
    )<types_of_waveguide>

== Types of antennas
=== Parabolic antenna
The basic of parabolic reflectors is that the shape of the antenna focuses the signal. The electromagnetic reciprocity theorem guarantees the same properties when transmitting and receiving. 

    #figure(
      image("images/introduction/parabolic_reflector.PNG", width: 50%),
      caption: [Parabolic reflector in theory]
    )<parabolic_reflector>

    #figure(
      image("images/introduction/parabolic_antenna.PNG", width: 60%),
      caption: [Parabolic reflector in practice]
    )<parabolic_antenna>

=== Offset antenna
    We can also use offset parabolic reflectors. They reduce accumulation of dirt and interferences from feed. It's best suited for small antenna area, otherwise mechanical stability, manufacturing issues and power consumption are better in a parabolic antenna of the same area.

    #figure(
      image("images/introduction/offset_reflector.PNG", width: 100%),
      caption: [Offset reflector]
    )<offset_reflector>

    #figure(
      image("images/introduction/offset_reflector_aim.PNG", width: 100%),
      caption: [Offset reflector aim]
    )<offset_reflector_aim>

    Feed horns can be active (does something to the signal) or passive. When passive, they introduce feeder losses and should be used only when there are no other valid alternatives. 

#pagebreak()
=== Cassegrain antenna

Cassegrain antenna, instead of having the feed in the focus, have a reflector and behind (at the vertex) it the feed. It reduces noise and feeder radiation to the side of the dish. Noise is reduced because it contains two reflector (less signal loss).

    #figure(
      image("images/introduction/cassegrain_vs_parabolic.PNG", width: 100%),
      caption: [Feeds: Cassegrain vs front]
    )<cassegrain_vs_front>

The larger the frequency, the greater the gain & narrower beam.

    #figure(
      image("images/introduction/antenna_types_comparison.PNG", width: 100%),
      caption: [Antenna types, comparison and summary]
    )<antenna_types_comparison>

=== Patch antenna & Beamforming

Patch antenna are flat, can be squares, circles or exagons and are composed of a dealetric substrate. Antenna array is a set of multiple antennas connected and working as one. They can combine to have narrower beam or filter undesired signals when receiving. To cover areas with difficult shapes we can feed multiple feeds with the same signals forming multiple shaped beams  (so, an array) or we can instead use non-parabolic shaped reflector (once manufactered you cannot change it) *or* we can also use reflect array (array of reflecting cells, experimental).

    #figure(
      image("images/introduction/beamforming.PNG", width: 100%),
      caption: [Beamforming]
    )<beamforming>


=== Polarization

Circular polarization allows us to disregard polarization alignment at the cost of complexity, bulk of equipment and manufactoring cost. 

Linear polarization is simpler and results in lower cost antennas but needs polarization adjustment, changes depending on coordinates and is distorted by the ionosphere.

Low gain antenna are usually on the opposite side of a high gain, because they need to be used dusing emergencies or specific operations. They can be built to send circular polarized signals. 

    #figure(
      image("images/introduction/antenna_summary.PNG", width: 85%),
      caption: [Antenna summary]
    )<antenna_summary>

= Space & Boundaries

== Satellites

Satellite boundaries by altitude:
- LEO (Low Earth Orbit): 160 - 2000km, contains small satellites with low power requirements. It has short round trip (time for the signal to be sent and received back) and it costs less to put in orbit. Is has small coverage and companies like Starlink need to put a costellation of satellite to cover a wide area;
- MEO (Medium Earth Orbit): 2000 - < 35.800km, not optimal for commercial use. Used for GPS & Science research;
- GEO (Geostationary Earth Orbit): 35.800km, Satellite in this orbit are seen as immobile from Earth. Used for broadcasting, meteo, and as a repeater for point to point links. 2 degree spacing is required between satellites. Orbits are not perfect and signal strength may vary;
- Graveyard: GEO + 300km, Satellite in GEO are sent here when they need to be put out of service.

Mention of honor to highly inclined orbits, they are hard to use on Earth because it has different speed w.r.t current distance from the planet. It can be used in missions to other planets.
== Space

We refer to "space communication systems" when ((Tx || Rx) || (Tx && Rx)) are in a spacecraft or outside Earth atmosphere.

Lagrangian point: points in which the forces of two bodies cancels out. For two given bodies there are 5 points. Relatively (to the two bodies) stationary.

Space boundaries:
- Geospace: is the region of outer space in the vicinity of the Earth. starts at 80km (or 100km) up to 40.000km
- Cislunar space: 80km (or 100km) kerman line up to earth-moon lagrangian point L2 at 440.000km;
- Deep space: there are various definitions but we care aboout the ITU definition because it defines the frequencies to use at certain distances (different frequencies for deep space and for near earth). > 2.000.000km is deep space.
- Near earth: Geospace (80km or 100km) up to 2.000.000km.

    #figure(
      image("images/introduction/deep_space_near_earth_bands.PNG", width: 100%),
      caption: [Frequency bands for deep space & near Earth]
    )<deep_space_near_earth_bands>

        #figure(
      image("images/introduction/space_boundaries.PNG", width: 130%),
      caption: [Visualization of space boundaries]
    )<space_boundaries>

= Noise

Noise refers to all unwanted contributions to the signal. Other signals interefences are also noise.

== Artificial noise
- For a resistor we can use gaussian noise to model the noise, in particular white noise with constant power spectral density. Black noise is a valid alternative because we are interested only in a specific portion of the spectrum.
$ N#sub[o] = K*T$, power delivered by a noise source is $P#sub[N] = k*T*B$
- Any amplifier worsens SNR but it is necessary, otherwise weak signals would be either impossible to process or overwhelmed by the internal noise of the components. The first amplifier when receiving *MUST* be low noise, because the amplifier noise is the major contribution to noise (after amplifying the signal, the noise sources introduced after it are not relevant). It's called *LOW-NOISE AMPLIFIER*.

T#sub[eq] = Equivalent Noise Temperature: The temperature that "represents the amplifier noise". More formally: it is the temperature of a resistance that, placed as input of an ideal noiseless amplifier, would provide the same output as the real amplifier.

Noise figure of the amplifier: $F(T#sub[A]) = 1+ (N#sub[o], "int")/(K*T#sub[A])$.

Noise figure at room temperature (290K): $F(T#sub[o]) = 1+(T#sub[eq])/(T#sub[o]).$

T#sub[eq] can be approximated to: $T#sub[eq] = (F-1) * T#sub[o] = 10^(x/10) -1 * 290k.$

== Natural noise
- Ground noise: Earth itself, it depends heavily on dish inclination (at 90 deg. it will be 0);
- Sky noise:
  - Sun: strong variable source of noise. Twice a year it interferes with GEO satellites;
  - Planets: negligible unless pointed directly at them;
  - Moon: negligible at offset angles > 2 degrees. Above 1 Ghz the noise is almost frequency indipendent;
  - Milky Way Galactic Noise (MWGN): At maximum when pointing at Saggittarius (center of the galaxy), 10.000k at 100Mhz, 1k at 1Ghz. As such it can be ignored at Ku-band or above *BUT must be considered below*;
  - Cosmic Microwave Background Radiation (CMBR): Always present \~= 2.7k.
- Atmosphere: We have differences between clear sky and rain, but we can approximate to $260k < T#sub[m] < 280k => ~275k. $ With clear sky we consider MWGN & CMBR. With rain we consider *only* losses caused by rain. After 10 Ghz noise from atmosphere gasses is dominant, with oxygen noise peaks at 22Ghz and 60Ghz. The cosmic noises like microwave background radiation is prevalent outside 1-15Ghz. If we increase elevation angle we reduce sky noise ex max = 0°, min = 90°;
- Ground noise: with elevation > 10° => 45-50k, for negative elevation 290k.

$ "SNR"#super[Clear] = (P#sub[s]#super[Clear])/(k(T#sub[CMBR] + T#sub[MWGN])B) $
$ "SNR"#super[Rain] = (P#sub[s]#super[Clear])/(L#sub[Rain]*k*T#sub[m]*B) $

Rainfall noise is relevant > 4 Ghz and reaches 100k near 15Ghz.
Below 1Ghz cosmic noise.

When looking at cascading systems, the noise contribution of the first device is the most important, as such it should have very high gain. We could use cryogenic cooling to reduce noise.

Figure of merit: $G/T$. With G= Gain at receiver frequency and T = Noise temperature.

Uplink noise: if there is rain it dominates the noise, otherwise we can approximate Earth noise at 290-300k. If the antenna is not pointed only at Earth but space as well we introduce CMBR + MWGN and reduce the Earth temperature influcence. 

    #figure(
      image("images/introduction/noise_summary.PNG", width: 100%),
      caption: [Noise sources summary]
    )<noise_sources_summary>

    #figure(
      image("images/introduction/noise_graph.PNG", width: 100%),
      caption: [Noise graph]
    )<noise_graph>

= Modulation

== Analog to digital
We use quantization to sample an analog signal. 

Nyquist theorem tells us that the sampling rate must be at least *TWICE* the baseband B$ => R#sub[s] >= 2B $

Digital processing is easier, cheaper, compressable, encryptable, can be stored easily, but requires more bandwidth and adds complexity & quantization noise.

We can compress a lot, trading off quality vs data rate. For example \~= 20Khz is the limit of human hearing, knowing this we don't need anything higher if we are transmitting only voice.
- Voice: \~= 10Kbps 
- mp3: \~= 32-320Kbps 
- CD: \~= 44.1Kbps 
- video: 2-40 Mbps
  - 480p: \~= 2-3 Mbps 
  - HD-FullHD: \~= 4-6 Mbps
  - 4k: \~= 19 Mbps
== Modulation 
Before sending a signal we need to go from base band to RF band. Modulation does this operation. It shifts from low frequencies to high. Reasons for modulating: an antenna may only operate in high frequencies.

Analog modulation: easy to demodulate, requires more power, used for AM radio.

Technologies for high power amplifiers include:
- TWTAS (Traveling-wave tube amplifiers ) based on waveguide;
- SSPA (Solid state power amplifier) based on semiconductors.

    #figure(
      image("images/introduction/exciter_transmitter.PNG", width: 70%),
      caption: [Structure of transmitter system with modulation]
    )<exciter_transmitter>

#pagebreak()
A good design for a complete system is the following image

    #figure(
      image("images/introduction/good_system_design.PNG", width: 130%),
      caption: [Good system design]
    )<good_system_design>

There are a lot of problems with analog modulation, for example we have to operate the HPA at saturation introducing the impossibility to use amplitude modulation & just phase and frequency. Frequency modulation introduces side lobes that must be filtered. 

== Digital modulation
There are various techniques to implement digital modulation:
- FSK (Frequencyu Shift Keying): Is very simple, uses a lot of bandwidth;
- BPSK (Binary Phase Shift Keying): It has only two possible values;
- QPSK (Quadrature Phase Shift Keying): It maps to a costellation of 4 values, it reduces a lot spectrum occupancy;
- 8PSK.

With BPSK we have main lobe +- R#sub[b] w.r.t carrier 2R#sub[b].

With QPSK we have main lobe +- R#sub[s] w.r.t carrier 2R#sub[s] = R#sub[b].

Same amount of information but half the band. 

$"BPSK" => R#sub[s] = R#sub[b]$; 
$"QPSK" => R#sub[s] = (R#sub[b])/2$;
$"8PSK" => R#sub[s] = (R#sub[b])/3$;
$"MPSK" => R#sub[s] = (R#sub[b])/(log#sub[2]M)$.

$E#sub[b] = P#sub[r] * T#sub[b] = (P#sub[r])/(R#sub[b])$. With E#sub[b] = energy per bit & P#sub[r] = average RF power of the received signal.

$E#sub[s] = E#sub[b] * log#sub[2] M$

$"BER" = "n. of err bit"/"tot. n. of bit"$. OR $(E#sub[b])/(N#sub[o])$ for fair comparisong between modulation schemes.

#pagebreak()

With bigger costellations it grows power demand as well. When sending a signal we have roll of factor (the time for the signal to rise and fall), we filter it and simplify B=R#sub[s]

So we can say that bit rate is closely related to bandwidth but they are not the same thing, depending on the modulation (and R#sub[s]) B changes usually when choosing costellation we assign signal so that errors result in fewest bit flip as possible.

== Multiple access
Multiple access allows multiple users to share the communication channels. We only saw two techniques but there are a lot (signal theory notes)

-FDMA (Frequency Division Multiple Access): divides the channel frequency and gives to each user a piece. Requires guard spaces between each piece. It's inflexible and used for TV broadcasting.

    #figure(
      image("images/introduction/FDMA.PNG", width: 70%),
      caption: [FDMA]
    )<fdma>

-TDMA (Time Division Multiple Access): Divides the usage in time, each user get the whole channel for a period. Requires precise synchronization. Used for digital TV.

    #figure(
      image("images/introduction/TDMA.PNG", width: 70%),
      caption: [TDMA]
    )<tdma>

= Codes

These codes are possible exploiting the properties of a digital system. Information is not degraded like in analog. It's either OK or NOT.

When we transmit bits we may have a lot of noise that, when sampling the signal, results in a bit flip. 

Error detection is the process of detecting errors, Error Correcting is the process of fixing errors. When using these techniques we add information to the transmission and as such we have more bits to send.

== Error detection codes
Transmission with only error detection are ARQ (automatic repeat request) and will check for errors and ask to resend the package if errors are found. The simplest form of EDC is parity check: we add a parity bit that is 1 if the number of 1/0 (to decide in the protocol which one) are odds. 0 otherwise. Parity check detects only odd number of bit flips, if the bit flips are even then it will fail and be unable to detect errors. 7 bit + 1 parity = 8 bit = 1 byte. 

The CRC is a better EDC, contains more redundant info to be able to suffer more noise. With _N_ as the total length of the packet and _k_ as the original packet at transmitter, we have $n=N-k$ check bits

== Error correcting codes
These types of codes use FEC (forward error correcting), this means that they have all the information to automatically correct errors without requesting anything back. This is a must have in space communication systems in which the time to send each package is a burden and would overwhelm buffers (While waiting for a ARQ response, all the received packages need to be stored).

Hamming distance: difference (distance) in bit from original packet to received (corrupted) packet.

FEC increases symbol rate by a factor of $1/r$.

There are different types of FEC, block codes operates _m_ chunks (blocks) of bits, convoluted codes instead operate bit by bit. The simplest example of Block codes is majority decoding: it will repeat _N_ times the bit and choose by majority, very inefficient bandwidth wise. Resistant to $(N/2)-1$ errors ex $N=3 => 1 "error"$.

Turbo codes are the best. They are close to the Shannon limit, that describes the boundary for bandwidth efficiency.



= Deep Space Network 

An international network of antennas to support spacecraft missions, radio and radar astronomy, and selected Earth orbiting missions. 

The network consists of 3 deep space communication facilities placed 120° apart. Goldstone (Mojave, USA); Madrid (Spain); Canterra (Australia).
    #figure(
      image("images/introduction/DNS_Antenna_coverage.PNG", width: 70%),
      caption: [DNS Antenna Coverage]
    )<dns_antenna_coverage>

LEO is inside the "blind spots". From GEO onward we have 100% coverage and some areas in which two antennas at the same time can fetch a signal.
These 3 places are chosen for their low rain probabilities, for political reasons (international alliances), and for geografical complementariety. 

In the network that we talked about, each site is made with:
- 1 70m antenna Cassegrain configuration;
- 1 34m High Efficiency Antenna (HEF) Cassegrain configuration;
- 3 34m Beam waveguide Antenna (BWG) configuration.
We need cryogenic in the receiver & we also need to reduce feed-system losses.
In DNS we need at least 20° angles otherwise we have η below accepted standards.

In the BWG configuration, we have the received signal carried through the waveguide behind the antenna to be processed. This means that all the processing components don't need to be engineered to turn with the antenna.

ESA also has a DNS network with sites in Australia, Spain, South America. Russian, China, India have them as well.

= Power/link budget
We can use solar panels up until Jupiter (Juno/Juice), from Jupiter onward we need nuclear reactors. 

EIRP = Effective Isotropic Radiated Power = Tx power into antenna \* Transmittor antenna gain. We calculate:

$ P#sub[HIGH POWER AMPLIFIER dB] = 10 * log#sub[10] ("watt value") + 30 $
$ P#sub[t] = P#sub[HPAdbW] - L#sub[FEED] $
$ "EIRP" = P#sub[tdbW] + G#sub[t dBi] $

In free space propagation the received power decays by 20dB per decade (every 10x the distance).

The link budget is an equation that allows the evaluation of the SNR at the output of the receiver (prior to analog to digital conversion and demodulation).

$ "SNR" = (P#sub[s])/(P#sub[n]) = C/N = "EIRP" - K + (G#sub[r])/(T#sub[tot]) - L#sub[sys] - L#sub[FS] - L#sub[atm] - R#sub[b] $

$ (C/N)#super[CLEAR] = (E#sub[b])/(N#sub[0]) * r * log#sub[2] M $

Coupling losses: occurs everytime we use connectors. losses already included in EIRP.

Sensitivity = the weakes signal power level that the receiver is able to detect and decode

In the uplink (satellite) there is no need for very low noise receiver, in the downlink it's beneficial.

