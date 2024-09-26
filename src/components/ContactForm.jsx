"use client";

import { useState } from 'react';
import { useId } from 'react';
import { Button } from '@/components/Button'; 

function TextInput({ label, ...props }) {
  const id = useId();

  return (
    <div className="group relative z-0 transition-all focus-within:z-10">
      <input
        type="text"
        id={id}
        {...props}
        placeholder=" "
        className="peer block w-full border border-neutral-300 bg-transparent px-6 pb-4 pt-12 text-base text-neutral-950 ring-4 ring-transparent transition focus:border-neutral-950 focus:outline-none focus:ring-neutral-950/5 group-first:rounded-t-2xl group-last:rounded-b-2xl"
      />
      <label
        htmlFor={id}
        className="pointer-events-none absolute left-6 top-1/2 -mt-3 origin-left text-base text-neutral-500 transition-all duration-200 peer-focus:-translate-y-4 peer-focus:scale-75 peer-focus:font-semibold peer-focus:text-neutral-950 peer-[:not(:placeholder-shown)]:-translate-y-4 peer-[:not(:placeholder-shown)]:scale-75 peer-[:not(:placeholder-shown)]:font-semibold peer-[:not(:placeholder-shown)]:text-neutral-950"
      >
        {label}
      </label>
    </div>
  );
}


function TextInputMessage({ label, ...props }) {
  const id = useId();

  return (
    <div className="group relative z-0 transition-all focus-within:z-10">
      <textarea
        id={id}
        {...props}
        placeholder=" "
        rows="3" 
        className="peer block w-full border border-neutral-300 bg-transparent px-6 pb-4 pt-12 text-base text-neutral-950 ring-4 ring-transparent transition focus:border-neutral-950 focus:outline-none focus:ring-neutral-950/5 group-first:rounded-t-2xl group-last:rounded-b-2xl resize-none" 
      />
      <label
        htmlFor={id}
        className="pointer-events-none absolute left-6 top-1/4 -mt-2 origin-left text-base text-neutral-500 transition-all duration-200 peer-focus:-translate-y-4 peer-focus:scale-75 peer-focus:font-semibold peer-focus:text-neutral-950 peer-[:not(:placeholder-shown)]:-translate-y-4 peer-[:not(:placeholder-shown)]:scale-75 peer-[:not(:placeholder-shown)]:font-semibold peer-[:not(:placeholder-shown)]:text-neutral-950"
      >
        {label}
      </label>
    </div>
  );
}

function RadioInput({ label, ...props }) {
  return (
    <label className="flex gap-x-3">
      <input
        type="radio"
        {...props}
        className="h-6 w-6 flex-none appearance-none rounded-full border border-neutral-950/20 outline-none checked:border-[0.5rem] checked:border-neutral-950 focus-visible:ring-1 focus-visible:ring-neutral-950 focus-visible:ring-offset-2"
      />
      <span className="text-base text-neutral-950">{label}</span>
    </label>
  );
}

export default function ContactForm() {
  const [formData, setFormData] = useState({
    name: '',
    email: '',
    company: '',
    phone: '',
    message: '',
    budget: '',
  });

  const [responseMessage, setResponseMessage] = useState('');

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData({ ...formData, [name]: value });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    console.log('Data being sent:', formData); 

    try {
      const response = await fetch('https://x6w8to15fb.execute-api.ap-southeast-2.amazonaws.com/Post', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(formData),
      });

      const result = await response.json();
      console.log(result);
      setResponseMessage(result.message);

      if (!response.ok) {
        console.error('Failed to submit the form', result);
      }
    } catch (error) {
      console.error('Error submitting form:', error);
      setResponseMessage('Error submitting form');
    }
  };

  return (
    <form onSubmit={handleSubmit}>
      <h2 className="font-display text-base font-semibold text-neutral-950">
        Work inquiries
      </h2>
      <div className="isolate mt-6 -space-y-px rounded-2xl bg-white/50">
        <TextInput label="Name" name="name" autoComplete="name" required onChange={handleChange} />
        <TextInput label="Email" type="email" name="email" autoComplete="email" required onChange={handleChange} />
        <TextInput label="Company" name="company" autoComplete="organization" onChange={handleChange} />
        <TextInput label="Phone" type="tel" name="phone" autoComplete="tel" onChange={handleChange} />
        <TextInputMessage label="Message" name="message" required onChange={handleChange} />
      </div>
      <Button type="submit" className="mt-10">
        Let’s work together
      </Button>
      {responseMessage && <p>{responseMessage}</p>} {/* Display the response message */}
    </form>
  );
}
