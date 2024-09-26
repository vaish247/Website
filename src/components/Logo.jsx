import { useId } from 'react'
import clsx from 'clsx'

export function Logomark({ invert = false, filled = false, ...props }) {
  // let id = useId()
  // return (
  //   <img viewBox="0 0 32 32"
  //     src="/images/EzzySoftLogo.svg" 
  //     alt="Logo"
  //     {...props}
  //   />
  // );
}


export function Logo({
  className,
  invert = false,
  filled = false,
  fillOnHover = false,
  ...props
}) {
  return (

    <div className="aspect-w-16 aspect-h-9">
      <img 
        src="/images/EzzySoftLogo.svg" 
        alt="Logo"
        className="transition-transform duration-300 ease-in-out transform hover:scale-110"
        {...props}
      />    
    </div>
  );
}
